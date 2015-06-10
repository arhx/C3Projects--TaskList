require 'sinatra'
require 'sinatra/reloader'

class TaskList < Sinatra::Base
	register Sinatra::Reloader

	get '/' do
		@title = "Task List"
		erb :home
	end

	get '/new_task' do
		@title = "Add new task"
		erb :new_task
	end

	# post '/new_task' do
	# 	@title = "Add new task"
	# 	erb :new_task
	# end

end
