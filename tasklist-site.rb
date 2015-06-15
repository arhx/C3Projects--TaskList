require 'sinatra'
require 'sinatra/reloader'
require './lib/database'
require './lib/interface'

class TaskListSite < Sinatra::Base
	register Sinatra::Reloader

	get '/' do
		@title 			= "Task List"

		interface 		= TaskList::Interface.new("tasklist.db")
		@all_records 	= interface.get_all_records

		erb :home
	end

	get '/:id/edit' do
		@title = "Edit task"

		@task_id = params[:id].to_i
		interface = TaskList::Interface.new("tasklist.db")
		@index, @name, @description, @date_completed = interface.get_record(@task_id).flatten
		erb :edit
	end

	post '/:id/edit' do
		@title = "Edit task"
		@task_id = params[:id].to_i

		if params[:completed] == "yes"
			interface = TaskList::Interface.new("tasklist.db")
			interface.update_completed_date(@task_id)
		end

		redirect '/'
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
