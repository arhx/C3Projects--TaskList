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
  	  query! insert_statement

      # determine what should be returned
    end

    def get_all_records
      select_statement = "SELECT * FROM tasks;"
      query! select_statement
      # the query select statement isn't returning a set of data, why?
    end


    def query!(statement, *params)
      db = SQLite3::Database.open database_name
      db.execute statement, params
    # rescue SQLite3::Exception => error
      # use this block to recover from an error
      # consider giving the user a special message back
      # inspect the `error` object for information about the error
    ensure
      db.close if db
    end
  end
end
