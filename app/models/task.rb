class Task < ActiveRecord::Base
		attr_accessible :name, :number, :navigation_title, :directory, :branch_name
	belongs_to :lesson
	def previous
		self.class.first(:conditions => ["id < ?", id], :order => "id desc")
	end

	def next
		self.class.first(:conditions => ["id > ?", id], :order => "id asc")
	end
end
