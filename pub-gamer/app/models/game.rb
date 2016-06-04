class Game < ActiveRecord::Base
	has_many :venue_games
	has_many :venues, through: :venue_games
end
