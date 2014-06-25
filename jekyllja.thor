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

    @ref ||= invoke(:ref, [options[:revision]], {'stdout' => false}).first
    ref_msg = build_ref_message(@ref)

    diff = get_diff(local.path, remote.path)
    
    if diff.empty?
      print "No diff on '#{file}' (#{ref_msg[:short]})\n"
    else
      if options[:save]
        save("#{ref_msg[:long]}\n#{diff}", options[:save_path], file, '.diff')
        f = File.basename(file, '.*') + '.diff'
        print "'#{f}' saved in '#{options[:save_path]}'\n"
      else
        print begin
          if options[:print_content]
            "#{ref_msg[:long]}\n#{diff}"
          else
            "Diff found on '#{file}' (#{ref_msg[:short]})\n"
          end
        end
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
    remote_path = File.join(options[:path], dir).sub(/\/.?$/, '')
    opts = { path:remote_path, ref:options[:revision] }
    remote_files = get_dir(options[:repo], opts)
    local_files = Dir.glob(["#{dir}/*", "#{dir}/.[^.]*"]).map { |f| File.basename(f) }

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
      end
      if removed_files.any?
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
      Thread.new(file) do |_file|
        Jekyllja.new.invoke(:diff, [_file], opts)
      end
    end.each(&:join)
  end

  desc "ref REF", "Get a revision(sha) of REF"
  option :stdout, default:true, type: :boolean, desc:'output revision(s) in terminal'
  def ref(ref='master')
    ref_shas =
      case ref
      when 'all'
        get_ref(options[:repo]).map do |res|
          {ref:res[:ref], sha:res[:object][:sha]}
        end
      when /^v\d/
        res = get_ref(options[:repo], "tags/#{ref}")
        [{ref:"ref/tags/#{ref}", sha:res[:object][:sha]}]
      else
        res = get_ref(options[:repo], "heads/#{ref}")
        [{ref:"ref/heads/#{ref}", sha:res[:object][:sha]}]
      end
    if options[:stdout]
      max_len = ref_shas.map { |h| h[:ref].size }.max
      ref_shas.each do |h|
        print "#{h[:ref].ljust(max_len)} => #{h[:sha]}\n"
      end
    else
      ref_shas
    end
  rescue Octokit::NotFound
    if options[:stdout]
      print "Reference `#{ref}` not found\n"
      exit(1)
    else
      [{ref:nil, sha:ref}]
    end
  end

  no_tasks do
    def get_content(repo, opts)
      if (user=options[:username]) && (pwd=options[:password])
        github_auth(user, pwd)
      end
      f = _get_content(repo, opts)
      content = Base64.decode64(f.content)
    end

    def get_dir(repo, opts)
      if (user=options[:username]) && (pwd=options[:password])
        github_auth(user, pwd)
      end
      _get_content(repo, opts).map(&:name)
    end

    def _get_content(repo, opts)
      Octokit.contents(repo, opts)
    rescue ::Octokit::TooManyRequests
      puts "API rate limit exceeded"
      puts "Use username and password options to make the limit up"
      puts "  ex. thor jekyllrb:diff_all docs --username=xxx --password=xxx"
      exit(1)
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

    def get_ref(repo, ref=nil)
      if (user=options[:username]) && (pwd=options[:password])
        github_auth(user, pwd)
      end
      case ref
      when :all, nil
        Octokit.refs(repo)
      else
        Octokit.ref(repo, ref)
      end
    end

    def build_ref_message(ref)
      pre = "Base revision:"
      if ref[:ref]
        rf  = "[#{ref[:ref]}]"
        srf = "[#{ref[:ref].match(/\w+$/).to_s}]"
      end
      {
        long: "#{pre} #{ref[:sha]}#{rf}",
        short:"#{pre} #{ref[:sha][0,7]}#{srf}"
      }
    end
  end
end
