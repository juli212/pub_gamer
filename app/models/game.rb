class Game < ActiveRecord::Base
	# include FormUpdater

	has_many :venue_games
	has_many :venues, through: :venue_games
	has_many :event_games
	has_many :events, through: :event_games

	validates :name, presence: true
	validates :name, uniqueness: true

	validates_length_of :name, maximum: 25, message: "over character limit"


	def self.game_search(term)
		term = term.gsub(/[^\d\sa-zA-Z_\.\,\-\+\!\?]/, "")
		where("name ILIKE :term", term: "%#{term.downcase}%")
	end

	def self.add_game(term)
		term = term.gsub(/[^\d\sa-zA-Z_\.\,\-\+\!\?]/, "")
		where("name ILIKE :term", term: "#{term.downcase}%")
	end

	def search_address
		""
	end

	def search_location
		""
	end

end
