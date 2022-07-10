require 'todo/version.rb'

# Add requires for other files you add to your project here, so
# you just need to require this one file in your bin file

module Todo
  def new_task(filename, task_names)
    File.open(filename, "a+") do |todo_file|
      tasks = 0
      task_names.each do |task|
        todo_file.puts [task, Time.now].join(",")
        tasks += 1
      end

      if tasks == 0
        raise "You must provide tasks on the command-line or standard input"
      end
    end

  rescue SystemCallError => ex
    raise RuntimeError, "Couldn't open #{filename} for appending: #{ex.message}"
  end
end
