

class Lesson < ActiveRecord::Base
	belongs_to :lesson_collection
	has_many  :tasks
		attr_accessible :name, :number, :navigation_title, :lesson_path
		
	def previous
		self.class.first(:conditions => ["id < ?", id], :order => "id desc")
	end

	def next
		self.class.first(:conditions => ["id > ?", id], :order => "id asc")
	end

	
end
