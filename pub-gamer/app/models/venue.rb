class Venue < ActiveRecord::Base
	belongs_to :user
	has_many :events
  	has_many :reviews
	has_many :venue_games
	has_many :games, through: :venue_games
	has_many :user_venues

	validates :name, :address, presence: true

	def game
		
	end

	def make_new(game_name)
		if !Game.find_by(name: game_name)
			new_game = Game.create(name: game_name)
			self.games << new_game
		else
			self.games << Game.find_by(name: game_name)
		end
	end

	def has_reviews?
		self.reviews.length > 0
	end

	def recent_reviews
		self.reviews.last(10).reverse
	end

end
