require 'sinatra'
require 'sinatra/reloader'
require './lib/database'
require './lib/task-record'

class TaskListSite < Sinatra::Base
	register Sinatra::Reloader

	get '/' do
		@title 			= "Task List"
		
		interface 		= TaskList::Interface.new("tasklist.db")
		@all_records 	= interface.get_all_records

		erb :home
	end

	get '/new_task' do
		@title = "Add new task"

		erb :new_task
	end

	post '/new_task' do
		@title 			= "Add new task"

		@tasklist 		= params[:tasklist]
		@name			= @tasklist[:name]
		@description	= @tasklist[:description]
		@completed_date	= @tasklist[:completed_date]

		interface 		= TaskList::Interface.new("tasklist.db")
		interface.insert_new_record(@name, @description, @completed_date)

		redirect '/'
	end
end
