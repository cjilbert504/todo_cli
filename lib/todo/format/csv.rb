module Todo
  module Format
    class CSV
      def format(index, task)
        complete_flag = task.completed? ? "C" : "U"
        printf("%d, %s, %s, %s, %s\n", index, task.name, complete_flag, task.created_date, task.completed_date)
      end
    end
  end
end
