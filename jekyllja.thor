require "tempfile"
require "fileutils"
require "base64"
require "open3"

require "octokit"
require "togglate"

class Jekyllja < Thor
  class_option :repo, aliases:'-g', default:"jekyll/jekyll", desc:'target repository'
  class_option :revision, aliases:'-r', default:'master', desc:'target revision'
  class_option :path, aliases:'-p', default:"site", desc:'target file path'
  class_option :username, desc:'github username'
  class_option :password, desc:'github password'

  desc "diff FILE", "Compare FILE between local and remote repository"
  option :save, aliases:'-s', default:false, type: :boolean
  option :save_path, default:"diff/tmp", desc:'save path'
  option :save_remote, default:false, type: :boolean
  option :print_content, default:true, type: :boolean, desc:'print diff content or just filename'
  def diff(file)
    opts = {'stdout' => false, 'save' => options[:save_remote]}
    remote =
      Tempfile.open("--remote-#{File.basename(file)}--") do |f|
        f.puts invoke(:get, [file], options.merge(opts))
        f
      end
    local =
      Tempfile.open("--local-#{File.basename(file)}--") do |f|
        f.puts read_local_file(file)
        f
      end

    diff = get_diff(local.path, remote.path)
    
    if diff.empty?
      print "No diff on '#{file}'\n"
    else
      if options[:save]
        save(diff, options[:save_path], file, '.diff')
        f = File.basename(file, '.*') + '.diff'
        print "'#{f}' saved in '#{options[:save_path]}'\n"
      else
        print(options[:print_content] ? diff : "Diff found on '#{file}'\n")
      end
    end
  end

  desc "get FILE", "Get FILE content from remote repository"
  option :save, aliases:'-s', default:false, type: :boolean
  option :save_path, default:"diff/tmp", desc:'save path'
  option :stdout, default:true, type: :boolean, desc:'output file content in terminal'
  def get(file)
    path = File.join(options[:path], file)
    content = get_content(options[:repo], path:path, ref:options[:revision])
    if options[:save]
      save(content, options[:save_path], file, File.extname(file))
    else
      options[:stdout] ? print(content) : content
    end
  rescue ::Octokit::NotFound
    puts "File not found at remote: '#{path}'"
    exit(1)
  end

  desc "dir_diff DIRECTORY", "Compare file exsistence in DIRECTORY between local and remote repository"
  option :save, aliases:'-s', default:false, type: :boolean, desc:'save new files'
  option :save_path, default:"diff/tmp", desc:'save path'
  def dir_diff(dir)
    path = File.join(options[:path], dir)
    opts = { path:path, ref:options[:revision] }
    remote_files = get_dir(options[:repo], opts)
    local_files = Dir.glob("#{dir}/*").map { |f| File.basename(f) }

    new_files = remote_files - local_files
    removed_files = local_files - remote_files
    
    if [new_files, removed_files].all?(&:empty?)
      puts "No new files, no removed files found"
    else
      if new_files.any?
        puts "New files found: #{new_files.join(', ')}"

        if options[:save]
          new_files.each do |file|
            opts = { path:File.join(path, file), ref:options[:revision] }
            content = get_content(options[:repo], opts)
            save(content, options[:save_path], file, File.extname(file))
            puts "  '#{file}' saved in '#{options[:save_path]}'"
          end
        end
      elsif removed_files.any?
        puts "Removed files found: #{removed_files.join(', ')}"
      end
    end
  end

  desc "diff_all DIRECTORY", "Do tasks :dir_diff and :diff for files in DIRECTORY"
  option :save, aliases:'-s', default:false, type: :boolean
  option :save_path, default:"diff/tmp", desc:'save path'
  option :save_remote, default:false, type: :boolean
  def diff_all(dir)
    invoke(:dir_diff, [dir], options)

    local_files = Dir.glob("#{dir}/*")
    opts = options.merge(print_content:false)
    local_files.map do |file|
      Thread.new do
        Jekyllja.new.invoke(:diff, [file], opts)
      end
    end.each(&:join)
  end

  no_tasks do
    def get_content(repo, opts)
      if (user=options[:username]) && (pwd=options[:password])
        github_auth(user, pwd)
      end
      f = Octokit.contents(repo, opts)
      content = Base64.decode64(f.content)
    end

    def read_local_file(file)
      co, _ = Togglate.commentout(File.read(file))
      co
    rescue ::Errno::ENOENT
      puts "File not found at local: '#{file}'"
      exit(1)
    end

    def get_diff(path1, path2)
      stdin, stdout, _ = Open3.popen2("diff -u #{path1} #{path2}")
      stdin.close
      stdout.read
    end

    def mkdir(dir)
      FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
    end

    def save(content, path, file, ext)
      mkdir(path)
      fname = [File.basename(file, ".*"), ext].join
      save_path = File.join(path, fname)
      File.write(save_path, content)
    end

    def get_dir(repo, opts)
      if (user=options[:username]) && (pwd=options[:password])
        github_auth(user, pwd)
      end
      Octokit.contents(repo, opts).map(&:name)
    end

    def github_auth(username, password)
      Octokit.configure do |c|
        c.login = username
        c.password = password
      end
      Octokit.user
    rescue ::Octokit::Unauthorized
      puts "Bad Credentials"
      exit(1)
    end
  end
end
