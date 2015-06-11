require 'sqlite3'

module TaskList
  class Interface < Database

    def insert_new_record(task_name, task_description, task_completed_date)
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
