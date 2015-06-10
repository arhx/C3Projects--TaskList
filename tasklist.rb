require 'sinatra'
require 'sinatra/reloader'

class TaskList < Sinatra::Base
	register Sinatra::Reloader

	get '/' do
		@title = "Task List"
		erb :home
	end
end
