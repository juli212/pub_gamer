class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue
	has_many :attendees
	has_many :comments
end
