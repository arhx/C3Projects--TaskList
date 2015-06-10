require 'sqlite3'
module TaskList
  class TaskRecord < Database
    def your_custom_query_here(*args)
      # santitize/validate your arguments

      # prepare your statement

      # call `query!` to interact with the database

      # determine what should be returned
    end
  end
end
