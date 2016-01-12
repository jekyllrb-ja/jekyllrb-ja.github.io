begin
  puts 'rake save_updates'
  `rake save_updates`
rescue => ex
  puts ex
  `rm -rf diff/_*`
  `git checkout diff/*`
end

puts 'Already exists files checkout'
`git checkout diff/*`
new_diff_file = `git st -s -- diff | awk '{print $2}'`

if new_diff_file == ''
  puts 'No diff files'
  exit 1
end

commit_log = 'Add new diff files '
begin
  new_diff_file.split("\n").each do |file|
    unless commit_log.include?('base_revision')
      commit_log += `head -1 #{file}`
    end
    puts "git add and rake create_issue #{file}"
    `git add #{file}`
    `rake create_issue[#{file}]`
  end
rescue => ex
  # callback
  puts ex
end

puts 'git commit'
`git commit -m '#{commit_log}'`
