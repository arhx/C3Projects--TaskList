require 'sqlite3'

module TaskList
  class TaskRecord < Database

    # def your_custom_query_here(*args)
    #   # santitize/validate your arguments

    #   # prepare your statement

    #   # call `query!` to interact with the database

    #   # determine what should be returned
    # end

    def insert_new_task(task_name, task_description, task_completed_date)
      # santitize/validate your arguments
      # prepare your statement

      insert_statement = "INSERT INTO tasks (name, description, completed_date) 
      	VALUES (\"#{task_name}\", \"#{task_description}\", \"#{task_completed_date}\");"

      # call `query!` to interact with the database
	  query!(insert_statement)

      # determine what should be returned
    end

  end
end
