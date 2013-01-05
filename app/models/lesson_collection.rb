class LessonCollection < ActiveRecord::Base
	has_many :lessons
	attr_accessible :name, :number, :navigation_title
	def previous
		self.class.first(:conditions => ["id < ?", id], :order => "id desc")
	end

end
