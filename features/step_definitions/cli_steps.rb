Given /^the file "([^"]*)" doesn't exist/ do |file|
  FileUtils.rm(file) if File.exists? file
end

Given /^there is no task list in my home directory$/ do
  step %(the file "#{ENV['HOME']}/.todo.txt" doesn't exist)
end

Given /^the task list should exist in my home directory$/ do
  step %(a file named "#{ENV['HOME']}/.todo.txt" should exist)
end
