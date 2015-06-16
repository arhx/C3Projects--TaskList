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

    def delete_record(task_id)
      delete_statement = "DELETE FROM tasks WHERE id=#{task_id};"
      query! delete_statement
    end

    def update_completed_date(task_id)
      update_statement = "UPDATE tasks
      SET completed_date = \"#{Time.now.strftime("%Y-%m-%d")}\"
      WHERE id=#{task_id};"
      query! update_statement
    end

    def edit_record(task_name, task_description, task_completed_date, task_id)
      update_statement = "UPDATE tasks
      SET name=\"#{task_name}\", description=\"#{task_description}\", 
        completed_date=\"#{task_completed_date}\" 
        WHERE id=#{task_id};"
      query! update_statement
    end
  end
end
