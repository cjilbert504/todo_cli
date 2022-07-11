module Todo
  module Format
    class Pretty
      def format(index, task)
        printf("%2d - %s\n", index, task.name)
        printf("      %-10s %\n", "Created:", task.created_date)
        if task.completed?
          printf("      %-10s %s\n", "Completed:", task.completed_date)
        end
      end
    end
  end
end
