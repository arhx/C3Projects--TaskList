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

    def get_record(task_id)
      select_statement = "SELECT * FROM tasks WHERE id=#{task_id};"
      query! select_statement
    end

    def update_completed_date(task_id)
      update_statement = "UPDATE tasks
      SET completed_date = \"#{Time.now}\"
      WHERE id=#{task_id};"
      query! update_statement
    end
  end
end
