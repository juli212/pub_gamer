class Venue < ActiveRecord::Base
	belongs_to :user
	has_many :events
	has_many :venue_games
	has_many :games, through: :venue_games
end
