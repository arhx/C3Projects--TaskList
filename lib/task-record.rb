require 'sqlite3'

module TaskList
  class TaskRecord < Database

    def insert_new_task(task_name, task_description, task_completed_date)
      # santitize/validate your arguments
      raise ArgumentError, 'Argument is not text.' unless task_name.is_a? String
      raise ArgumentError, 'Argument is not text.' unless task_description.is_a? String
      raise ArgumentError, 'Argument is not text.' unless task_completed_date.is_a? String

      insert_statement = "INSERT INTO tasks (name, description, completed_date)
      	VALUES (\"#{task_name}\", \"#{task_description}\", \"#{task_completed_date}\");"
  	  query! insert_statement
    end

    def get_all_records
      select_statement = "SELECT * FROM tasks;"
      query! select_statement
    end

  end
end
