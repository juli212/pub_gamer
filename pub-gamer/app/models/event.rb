class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue

	has_many :comments
	has_many :event_games
	has_many :games, through: :event_games
	has_many :user_events
	has_many :guests, through: :user_events, source: :user

	def full?
		
	end
end
