class Game < ActiveRecord::Base
	has_many :venue_games
	has_many :venues, through: :venue_games
	has_many :event_games
	has_many :events, through: :event_games

	validates :name, presence: true
	validates :name, uniqueness: true
end
