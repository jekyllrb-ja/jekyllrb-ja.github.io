require "octokit"
require "gh-diff"

Dotenv.load

GITHUB_HOST = "https://github.com"
GITHUB_USER = 'jekyll'
GITHUB_REPOSITORY = 'jekyll'
RAW_URL = 'https://raw.githubusercontent.com'

task :default => :togglate

desc "diff local and original document at BASE_REVISION"
# args:
#   rev: base rivision(ex: rev=master)
#   files: diff target file(ex: files=docs/*.md )
task :togglate do
  files = ENV['files']
  if files.nil?
    files = `git diff --name-only HEAD~ -- docs`
    files = files.split("\n")
  end
  puts "files: #{files}"

  ok_files = []
  ng_files = []

  Dir.glob(files).each do |file|
    revision = ENV['rev']
    if revision.nil?
      revision = read_base_revision(file) || 'master'
    end
    puts "base revision: #{revision}"

    ORIGINAL_DOC_URL = "#{RAW_URL}/#{GITHUB_USER}/#{GITHUB_REPOSITORY}/#{revision}/site"
    puts "original doc url: #{ORIGINAL_DOC_URL}"

    begin
      # check togglate command
      togglate = 'togglate'
      system( "#{togglate} > /dev/null" )
      unless $? == 0
        togglate = "bundle exec #{togglate}"
        system ( "#{togglate} > /dev/null" )
        unless $? == 0
          puts 'Please install togglate: $ gem install togglate'
          exit 1
        end
      end

      local_doc = "#{file}_local"
      origin_doc = "#{file}_origin"

      # output local document
      system( "#{togglate} commentout #{file} > #{local_doc}" )
      # output original document
      file_exist = system( "curl -sf #{ORIGINAL_DOC_URL}/#{file} > #{origin_doc}" )
      unless file_exist
        fail "`curl`: No such file - '#{ORIGINAL_DOC_URL}/#{file}'"
      end
      # system( "git diff --no-index #{local_doc} #{origin_doc}" )
      system( "diff -u #{local_doc} #{origin_doc}" )
      case $?
      when 0
        ok_files << file
      else
        ng_files << file
      end
    ensure
      [local_doc, origin_doc].each do |f|
        system("rm", f) if File.exist?(f)
      end
    end
  end

  puts "OK:"
  p ok_files
  puts "NG:"
  p ng_files

  if ng_files.empty?
    exit 0
  else
    exit 1
  end
end

desc "jekyll syntax check (try jekyll build)"
task :jekyll do
  # check jekyll command
  jekyll = 'jekyll'
  system( "#{jekyll} > /dev/null" )
  unless $? == 0
    jekyll = "bundle exec #{jekyll}"
    system ( "#{jekyll} > /dev/null" )
    unless $? == 0
      puts 'Please install jekyll: $ gem install jekyll'
      exit 1
    end
  end

  # create _config.yml
  config_yml = '_config_rake_jekyll.yml'
  system( "echo 'exclude: ['vendor']' >> #{config_yml}" )
  system( "echo 'markdown: kramdown' >> #{config_yml}" )

  # try jekyll build
  system( "#{jekyll} build --config _config.yml,#{config_yml}" )
  result = $?

  system( "rm #{config_yml}" )

  case result
  when 0
    exit 0
  else
    exit 1
  end
end

desc "Create issue for a file"
task :create_issue, "path"
task :create_issue do |x, args|
  path = args.path
  if path.nil?
    fail "A file path required: e.g. create_issue['diff/docs/index.diff']"
  elsif !File.exist?(path)
    fail "File NotFound: #{path}"
  end

  myrepo = ENV['MYREPO']
  myrevision = ENV['MYREVISION']

  cont =
    case path
    when /diff$/
      build_issue_content(:update, GITHUB_HOST, myrepo, myrevision, path)
    when /(md|markdown)$/
      build_issue_content(:new, GITHUB_HOST, myrepo, myrevision, path)
    when /delete$/
      build_issue_content(:delete, GITHUB_HOST, myrepo, myrevision, path)
    else
      fail "Only accept 'diff' or 'markdown'"
    end

  GhDiff::Auth[ username:ENV['USERNAME'], password:ENV['PASSWORD'],
                token:ENV['TOKEN'] ]

  Octokit.create_issue(myrepo, cont[:title], cont[:body], labels:cont[:label])
  puts "Issue created successfully for #{path}"
  exit(0)
end

# This task activates `dir_diff` and `diff` commands of `gh-diff`:
#   - dir_diff: it compares file existence in the docs directory
#               between original repo and local.
#   - diff:     it takes diffs docs in original repo with commentout
#               texts in local docs.
# note: You need to setup some environment variables for this task.
#       Check a README of gh-diff.
desc "Check updates for doc files in original repo"
task :check_updates do
  GhDiff::CLI.start(["dir_diff", "docs"])
  puts "\e[33mDiff files:\e[0m"
  GhDiff::CLI.start(["diff", "docs", "--commentout"])
end

# This task activates `dir_diff` and `diff` commands of `gh-diff`
# with save option. Files will be saved to 'diff' directory of
# the project root.
desc "Save updates for doc files in original repo"
task :save_updates do
  GhDiff::CLI.start(["dir_diff", "docs", "--save", "--ref"])
  puts "\e[33mDiff files:\e[0m"
  GhDiff::CLI.start(["diff", "docs", "--commentout", "--save"])
end

def build_issue_content(type, host, repo, revision, path)
  repo_file_link = File.join(host, repo, 'blob', revision, path)
  repo_source_link = build_repo_file_link(host, repo, revision, path, '.md')
  org_rev_link =
    if base_rev = read_base_revision(path)
      File.join(host, GITHUB_USER, GITHUB_REPOSITORY, 'commit', base_rev)
    else
      ''
    end

  case type
  when :update
    template_update(repo_file_link, repo_source_link, org_rev_link)
  when :new
    template_new(repo_file_link, repo_source_link, org_rev_link)
  when :delete
    template_delete(repo_source_link, org_rev_link)
  end
end

def build_repo_file_link(host, repo, revision, path, ext)
  _, *dir, file = path.split('/')
  file = File.basename(file, '.*') + ext
  File.join(host, repo, "blob", revision, *dir, file)
end

def read_base_revision(path)
  rev_re = /^(?:B|b)ase.revision:\s*([a-z0-9]+)/
  md = File.read(path).match(rev_re)
  md ? md[1] : nil
end

def template_update(file_link, source_link, original_rev_link)
  title = "Need to update! #{File.basename(source_link)}"
  body =<<-EOS
Original file revised. Need to update our translation:

  Diff: #{file_link}
  File: #{source_link}
  Base Revision: #{original_rev_link}
  EOS
  label = 'Original Updated'
  { title:title, body:body, label:label }
end

def template_new(file_link, source_link, original_rev_link)
  title = "Need to translate! #{File.basename(file_link)}"
  body = <<-EOS
Original file created. Need to translate:

  File: #{file_link}
  Base Revision: #{original_rev_link}
  EOS
  label = 'Original Created'
  { title:title, body:body, label:label }
end

def template_delete(source_link, original_rev_link)
  title = "Need to delete! #{File.basename(source_link)}"
  body = <<-EOS
Original file removed. Need to delete:

Note that this might be caused by renaming file or merging the content to another file.

  File: #{source_link}
  Base Revision: #{original_rev_link}
  EOS
  label = 'Original Removed'
  { title:title, body:body, label:label }
end
