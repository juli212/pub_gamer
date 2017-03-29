class Venue < ActiveRecord::Base
	belongs_to :user
	belongs_to :neighborhood
	
	has_many :events
  has_many :reviews
	has_many :venue_games
	has_many :games, through: :venue_games
	has_many :events
	has_many :user_venues
	has_many :user_reports

	validates :name, :address, presence: true
	validates :address, uniqueness: true
	validates_length_of :name, :address, maximum: 150, message: "over character limit"
	validates :name, format: {
		with: /\A[\d\sa-zA-Z_\.\,\-\+\!\?]+\z/,
		message: "Invalid characters: Acceptable characters are A-Z, a-z, 0-9"
	}

	def game
	end

	def add_neighborhood(hood)
		Neighborhood.find_or_create_by(name: hood.titleize)
	end

	def self.search(term)
		term = term.gsub(/[^\d\sa-zA-Z_\.\,\-\+\!\?]/, "")
		# term = term.gsub(/[\'s\o']/,'')
		# term = term.gsub(/[^0-9a-zA-Z_\,\.\+\-\?]/,'')
		# term = term.gsub("'","").gsub("&", "")
		venues = Venue.venue_search(term) + Venue.multi_word_search(term) + Venue.game_search(term) + Venue.search_neighborhood(term)
		venues.uniq
	end

	def self.multi_word_search(term)
		words = term.split.join(' & ')
		joins(:games).joins(:neighborhood).where("to_tsvector(venues.name || ' ' || venues.address || ' ' || neighborhoods.name || ' ' || games.name) @@ to_tsquery('#{words}')")		
	end

	def self.venue_search(term)
		where("name ILIKE :term OR address ILIKE :term", term: "%#{term.downcase}%")
	end

	def self.game_search(term)
		joins(:games).where("games.name ILIKE :term", term: "%#{term.downcase}%").uniq
	end

	def self.search_neighborhood(term)
		joins(:neighborhood).where("neighborhoods.name ILIKE :term", term: "%#{term.downcase}%").uniq
	end

#used in add_venue, events controller:
	def self.venue_name_search(term)
		where("name ILIKE :term", term: "%#{term.downcase}%")
	end

	def search_address
		" - " + self.address
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

	def show_reviews
		self.sorted_reviews.reject { |review| review.deleted == true }
	end

	def not_deleted_reviews
		self.reviews.where(deleted: false)
	end

	def sorted_reviews
		self.reviews.order(:created_at).reverse
	end

	def sum_reviews
		rating = 0
		self.reviews.each do |review|
			if review.rating
				rating += review.rating unless review.deleted == true
			end
		end
		rating
	end

	def avg_rating
		rated_reviews = self.reviews.where(rating: 1..5, deleted: false)
		avg_rating = self.sum_reviews/rated_reviews.length.to_f
		avg_rating.round(2)
	end

	# def replaceAnd
	# 	name.gsub!("&","\&")
	# end

	# def removeCharacters
	# 	name.gsub!("'", "")
	# end

	# def replaceCharacters
	# 	self.replaceAnd
	# 	self.removeCharacters
	# end

	def slug
		self.name.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end

end

# & ' ( )
# - _ + , . 