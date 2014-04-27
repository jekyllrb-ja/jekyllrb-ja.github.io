task :default => :test

desc "diff local and original document at BASE_REVISION"
# args:
#   rev: base rivision(ex: rev=master)
#   files: diff target file(ex: files=docs/*.md )
task :test do
  GITHUB_USER = 'jekyll'
  GITHUB_REPOSITORY = 'jekyll'
  RAW_URL = 'https://raw.githubusercontent.com'

  BASE_REVISION = '5daf987'
  revision = ENV['rev']
  if revision.nil?
    revision = BASE_REVISION
  end
  puts "base revision: #{revision}"

  ORIGINAL_DOC_URL = "#{RAW_URL}/#{GITHUB_USER}/#{GITHUB_REPOSITORY}/#{revision}/site"
  puts "original doc url: #{ORIGINAL_DOC_URL}"

  files = ENV['files']
  if files.nil?
    files = `git diff --name-only HEAD~ -- docs`
    files = files.split("\n")
  end
  puts "files: #{files}"

  ok_files = []
  ng_files = []

  Dir.glob(files).each do |file|
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
    system( "curl -s #{ORIGINAL_DOC_URL}/#{file} > #{origin_doc}" )
    # system( "git diff --no-index #{local_doc} #{origin_doc}" )
    system( "diff -u #{local_doc} #{origin_doc}" )
    case $?
    when 0
      ok_files << file
    else
      ng_files << file
    end
    system( "rm #{local_doc} #{origin_doc}" )
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
