# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#First begin with clean slate

Task.delete_all
Lesson.delete_all
LessonCollection.delete_all

#Module1
lc = LessonCollection.create(:number => 1,
	                    :name => "Learning Rails basics",
						:navigation_title => "Getting started with Rails")


#Module1 Lesson2
l = lc.lessons.create(:number => 1,
	         :name => "Creating a new app" , 
	         :navigation_title => "Zero to app in 5 steps",
	         :lesson_path => "Module1/lesson2")


##Module1 lesson1 Task1
t = l.tasks.create(:number => 1,
	         	   :name => "Create default app - your_site" , 
	               :navigation_title => "Default app - your_site",
			 	   :branch_name => "default-rails-app",
	               :directory => "Module1/tasks/lesson2/task1")



#Module1 lesson3
l = lc.lessons.create(:number => 2 ,
	          :name => "Understanding Rails directory" , 
	          :navigation_title => "Rails directory structure",
	          :lesson_path => "Module1/lesson3")



#Module1 lesson4
l = lc.lessons.create(:number => 3 ,
	          :name => "Adding Helloworld page" , 
	          :navigation_title => "Say hello through Rails",
	          :lesson_path => "Module1/lesson4")

##Module1 lesson4 Task1
t = l.tasks.create(:number => 1,
	          	   :name => "Test HelloWorld.html page" , 
			 	   :branch_name => "HelloWorld",
	               :directory => "Module1/tasks/lesson4/task1")


#Module1 lesson5
l = lc.lessons.create(:number => 4 ,
	          :name => "Adding pages from Rails controller" , 
	          :navigation_title => "Pages using controller",
	          :lesson_path => "Module1/lesson5")

#Module1 lesson5 Task1
t = l.tasks.create(:number => 1,
	          	   :name => "Create home & about pages through controller" , 
	               :navigation_title => "Home & about pages",
			 	   :branch_name => "master",
	     	       :directory => "Module1/tasks/lesson5/task1")

#Module1 lesson6
l = lc.lessons.create(:number => 5 ,
	          :name => "Understanding Rails model view controller (MVC)" , 
	          :navigation_title => "Visualizing Rails flow",
	          :lesson_path => "Module1/lesson6")

#Module1 lesson6 Task1
#t = l.tasks.create(:number => 1,
#	               :navigation_title => "",
#	               :directory => "Module1/tasks/lesson7/task1")



#Module 2
=begin
lc = LessonCollection.create(:number => 2,
	                    :name => "How to build an app",
						:navigation_title => "Deciding on the app")

#Module 2 lesson1
l = lc.lessons.create(:number => 1 ,
	          :name => "Common app features | Why to-do list" , 
	          :navigation_title => "Listing common features",
	          :lesson_path => "Module2/lesson1")

#Module 2 lesson2
l = lc.lessons.create(:number => 2 ,
	          :name => "Mapping to-do list app to Rails" , 
	          :navigation_title => "Modeling to-do list app",
	          :lesson_path => "Module2/lesson2")
=end
#Module 3
lc = LessonCollection.create(:number => 2,
	                    :name => "Building to-do list web app",
						:navigation_title => "Starting with to-do list app")

l = lc.lessons.create(:number => 1 ,
	          :name => "How to design a Rails app" , 
	          :navigation_title => "Designing to-do list app",
	          :lesson_path => "Module2/lesson2")


#Module 3 lesson 1
l = lc.lessons.create(:number => 2 ,
	          :name => "Creating routes, controllers & views | ruby tutorial" , 
	          :navigation_title => "Todos from controller",
	          :lesson_path => "Module3/lesson1")

#Module 3 lesson 1 Task 1
t = l.tasks.create(:number => 1,
	          	   :name => "Display one hardcoded todo from controller" , 
	               :navigation_title => "Display one todo",
	               :branch_name => "display-1-todo",
	               :directory => "Module3/tasks/lesson1/task1")

#Module 3 lesson 1 Task 2
t = l.tasks.create(:number => 2,
	          	   :name => "Display multiple hardcoded todos from controller using array" , 
	               :navigation_title => "Display multiple todos",
	               :branch_name => "display-multiple-todos",
	               :directory => "Module3/tasks/lesson1/task2")




#Module 3 lesson 2
l = lc.lessons.create(:number => 3 ,
	          :name => "Rails models - create, migrate, rollback and destroy" , 
	          :navigation_title => "Model to store/fetch todos",
	          :lesson_path => "Module3/lesson2")

#Module 3 lesson 2 Task 1
t = l.tasks.create(:number => 1,
	          	   :name => "Store todo using Console, fetch it in controller & show on the view" , 
	               :navigation_title => "Todos from database",
	               :branch_name => "todo-from-db",
	               :directory => "Module3/tasks/lesson2/task1")

l = lc.lessons.create(:number => 4 ,
			   :name => "Implementing 'delete last todo' link" , 
			   :navigation_title => "Learning to delete last todo",
	           :lesson_path => "Module3/tasks/lesson2/task2/task")


#Module 3 lesson 2 Task 2
t = l.tasks.create(:number => 1,
	               :branch_name => "delete-last-todo",
	               :directory => "Module3/tasks/lesson2/task2")

#Module 3 lesson 3
l = lc.lessons.create(:number => 5 ,
	          :name => "Views, layout, helper methods & assets pipeline" , 
	          :navigation_title => "Add Twitter Bootstrap CSS",
	          :lesson_path => "Module3/lesson3")

#Module 3 lesson 3 Task 1
t = l.tasks.create(:number => 1,
	          	   :name => "Add bootstrap CSS, insert navbar & put todos in well" , 
	               :navigation_title => "Bootstrap CSS with navbar",
	               :branch_name => "beautiful-todo-app",
	               :directory => "Module3/tasks/lesson3/task1")

#Module 3 lesson 3 Task 2
#t = l.tasks.create(:number => 2,
#	          	   :name => "Change title of the index page" , 
#	               :navigation_title => "Change HTML title",
#	               :directory => "Module3/tasks/lesson3/task2")

#Module 3 lesson 3 Task 3
#t = l.tasks.create(:number => 2,
#	          	   :name => "Include modal, modify delete to use link_to & redirect_to" , 
#	               :navigation_title => "Use modal & helper functions",
#	               :directory => "Module3/tasks/lesson3/task2")

#Module 3 lesson 4
#l = lc.lessons.create(:number => 5 ,
#	          :name => "Introducing Ruby Gems through Twitter Bootstrap Gem" , 
#	          :navigation_title => "Bootstrap CSS via Ruby Gem",
#	          :lesson_path => "Module3/lesson4")

#Module 3 lesson 3 Task 1
#t = l.tasks.create(:number => 1,
#	          	   :name => "Remove bootstrap.css, incorporate Gem, create fixed layout" , 
#	               :navigation_title => "Bootstrap Gem, fixed layout",
#	               :directory => "Module3/tasks/lesson4/task1")


#Module 4
lc = LessonCollection.create(:number => 3,
	          			:name => "Introducing forms, migrations & ajax in Rails",
						:navigation_title => "Add, delete, mark & unmark todos") 

l = lc.lessons.create( 
	          :number => 1 ,
	          :name => "Rails forms, params, attr_accessible, validation" , 
	          :navigation_title => "Add todo from the view",
	          :lesson_path => "Module4/lesson1")

t = l.tasks.create(:number => 1,
	               :name => "Implement adding todo",
	               :navigation_title => "Form to add todo",
	               :branch_name => "add-todo-form_tag",
	               :directory => "Module4/tasks/lesson1/task1")

t = l.tasks.create(:number => 2,
	               :name => "Implement adding todo with validations",
	               :navigation_title => "Form to add todo and validation",
	               :branch_name => "add-todo-form_tag",
	               :directory => "Module4/tasks/lesson1/task2")

l = lc.lessons.create( 
	          :number => 2 ,
			   :name => "form_for in Rails",
			   :navigation_title => "Adding todo through form_for",
	          :lesson_path => "Module4/tasks/lesson1/task3/task")


t = l.tasks.create(:number => 1,
	               :name => "How to use form_for",
	               :navigation_title => "form_for instead of form_tag",
	               :branch_name => "todo-add-via-form-for",
	               :directory => "Module4/tasks/lesson1/task3")

l = lc.lessons.create( 
	          :number => 3 ,
	          :name => "Rails migration, form_for & checkboxes" ,
	          :navigation_title => "Mark todo complete",
	          :lesson_path => "Module4/lesson2")

t = l.tasks.create(:number => 1,
	               :name => "Marking todos complete",
	               :navigation_title => "Marking todos complete",
	               :branch_name => "complete-todo",
	               :directory => "Module4/tasks/lesson2/task1")

t = l.tasks.create(:number => 2,
	               :name => "Toggle todos status",
	               :navigation_title => "Toggle todos",
	               :branch_name => "toggle-todos",
	               :directory => "Module4/tasks/lesson2/task2")

l = lc.lessons.create( 
	          :number => 4 ,
	          :name => "Coming soon" , 
	          :navigation_title => "Edit & delete todos",
	          :lesson_path => "Module4/lesson3")

=begin
t = l.tasks.create(:number => 1,
	               :name => "Mark todos complete & pending",
	               :navigation_title => "Mark todos complete & pending",
	               :directory => "Module4/tasks/lesson3/task1")

t = l.tasks.create(:number => 2,
	               :name => "Deleting todos ",
	               :navigation_title => "Deleting todos",
	               :directory => "Module4/tasks/lesson3/task2")

=end
l = lc.lessons.create( 
	          :number => 5 ,
	          :name => "Coming soon" , 
	          :navigation_title => "Ajaxifying operations",
	          :lesson_path => "Module4/lesson4")
