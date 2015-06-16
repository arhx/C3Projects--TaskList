require 'sinatra'
require 'sinatra/reloader'
require './lib/database'
require './lib/interface'

class TaskListSite < Sinatra::Base
	register Sinatra::Reloader

	get '/' do
		@title 			= "Task List"
		@completed = ""

		interface 		= TaskList::Interface.new("tasklist.db")
		@all_records 	= interface.get_all_records

		erb :home
	end

	post '/' do
		@title = "Task List"

		@task_id = params[:task_index].to_i

		if params[:completed] == "completed?"
			interface = TaskList::Interface.new("tasklist.db")
			interface.update_completed_date(@task_id)
		end

		redirect '/'
	end

	get '/:id/edit' do
		@title = "Edit task"

		@task_id = params[:id].to_i
		interface = TaskList::Interface.new("tasklist.db")
		@old_index, @old_name, @old_description, @old_date = interface.get_record(@task_id).flatten
		@record = interface.get_record(@task_id)

		erb :edit
	end

	post '/:id/edit' do
		@title = "Edit task"
		@task_id = params[:id].to_i

		@name			= params[:name]
		@description	= params[:description]
		@completed_date	= params[:completed_date]

		interface = TaskList::Interface.new("tasklist.db")
		interface.edit_record(@name, @description, @completed_date, @task_id)

		redirect '/'
		# erb :edit
	end

	get '/:id/delete' do
		@title = "Delete task"

		@task_id = params[:id].to_i

		interface = TaskList::Interface.new("tasklist.db")
		@index, @name, @description, @date_completed = interface.get_record(@task_id).flatten

		erb :delete
	end

	post '/:id/delete' do
		@title = "Delete task"

		@task_id = params[:id].to_i
		if params[:delete] == "Yes, delete it!"
			interface = TaskList::Interface.new("tasklist.db")
			interface.delete_record(@task_id)
		end

		redirect '/'
	end

	get '/new_task' do
		@title = "Add new task"

		erb :new_task
	end

	post '/new_task' do
		@title 			= "Add new task"

		@name			= params[:name]
		@description	= params[:description]
		@completed_date	= params[:completed_date]

		interface 		= TaskList::Interface.new("tasklist.db")
		interface.insert_new_record(@name, @description, @completed_date)

		redirect '/'
	end
end
