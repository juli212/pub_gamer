class Venue < ActiveRecord::Base
	belongs_to :user
	has_many :events
  has_many :reviews
	has_many :venue_games
	has_many :games, through: :venue_games
	has_many :user_venues

	validates :name, :address, presence: true
	validates :address, uniqueness: true

	def game
	end

	def self.search(term)
		where("name ILIKE :term OR address ILIKE :term", term: "%#{term.downcase}%")
	end

	def make_new(game_name)
		if !Game.find_by(name: game_name)
			new_game = Game.create(name: game_name)
			self.games << new_game
		else
			self.games << Game.find_by(name: game_name)
		end
	end

	def has_games?
		self.games.length > 0
	end

	def has_reviews?
		self.reviews.length > 0
	end

	def recent_reviews
		self.reviews.last(10).reverse
	end

	def sum_reviews
		rating = 0
		self.reviews.each do |review|
			if review.rating
				rating += review.rating
			end
		end
		rating
	end

	def avg_rating
		rated_reviews = self.reviews.where(rating: 1..5)
		avg_rating = self.sum_reviews/rated_reviews.length.to_f
		avg_rating.round(2)
	end

end
