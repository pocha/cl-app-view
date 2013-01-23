class AppsController < ApplicationController

	def new_layout

		if !params[:module_number].nil? and !params[:lesson_number].nil?
			@current_module = LessonCollection.find_by_number(params[:module_number]) || not_found
			@current_lesson = @current_module.lessons.find_by_number(params[:lesson_number]) || not_found
			@module_no = params[:module_number]
			@lesson_no = params[:lesson_number]
			@task_no = params[:task_number]
			@title = @current_lesson.name.gsub("-", " ") + ' | Ruby on Rails Tutorial | Codelearn'
			render 'new_layout_lesson', :layout => 'new_layout'  and return
		else
			@title = 'Ruby on Rails Tutorial | Codelearn'
			render 'new_layout_initial', :layout => 'new_layout'  and return
		end


	end

end
