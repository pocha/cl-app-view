class Invite < ActiveRecord::Base

	validates :email, :presence => true, :uniqueness => true, :format => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
	attr_accessible :email
end
