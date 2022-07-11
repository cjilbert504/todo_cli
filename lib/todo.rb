require 'todo/version.rb'

# Add requires for other files you add to your project here, so
# you just need to require this one file in your bin file

module Todo
  class Task
    def self.from_file(file)
      tasks = []

      file.readlines.each do |line|
        name, created, completed = line.chomp.split(/,/)
        tasks << Task.new(name, created, completed)
      end

      tasks
    end

    attr_reader :name, :created_date, :completed_date

    def initialize(name, created_date, completed_date)
      @name = name
      @created_date = created_date
      @completed_date = completed_date
    end

    def completed?
      !completed_date.nil?
    end

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
end
