module AppsHelper
	def create_lesson_url(lc, lesson)
		lesson_url = lesson_path(lc.number,lc.name.gsub(" ", "-"),lesson.number, lesson.name.gsub(" ", "-"))
	end
	
	def create_task_url(lc, lesson, task)
		task_url = task_path(lc.number,lesson.number, lesson.name.gsub(" ", "-"), task.number, task.name.gsub(" ", "-"))
	end

	def create_url(obj)
		if obj.class.name == "Lesson"
			return create_lesson_url(obj.lesson_collection, obj)
		else
			return create_task_url(obj.lesson.lesson_collection, obj.lesson, obj)
		end
	end
end
