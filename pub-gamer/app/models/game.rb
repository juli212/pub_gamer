class Game < ActiveRecord::Base
	has_many :venue_games
	has_many :event_games
	has_many :venues, through: :venue_games
	has_many :events, through: :event_games
end
