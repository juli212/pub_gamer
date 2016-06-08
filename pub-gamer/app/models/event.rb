class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue
	has_many :attendees
	has_many :comments
	has_many :event_games
	has_many :games, through: :event_games
end
