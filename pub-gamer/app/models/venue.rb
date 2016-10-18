class Venue < ActiveRecord::Base
	belongs_to :user
	belongs_to :neighborhood
	
	has_many :events
  has_many :reviews
	has_many :venue_games
	has_many :games, through: :venue_games
	has_many :events
	has_many :user_venues

	validates :name, :address, presence: true
	validates :address, uniqueness: true

	def game
	end

	def add_neighborhood(hood)
		Neighborhood.find_or_create_by(name: hood.titleize)
	end

	# def self.single_phrase_search(term)
	# 	venues = Venue.venue_search(term) + Venue.game_search(term)
	# 	venues.uniq
	# end

	def self.search(term)
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
		# where("neighborhood ILIKE :term", term: "%#{term.downcase}%").pluck(:neighborhood).uniq
	end

#used in add_venue, events controller:
	def self.venue_name_search(term)
		where("name ILIKE :term", term: "%#{term.downcase}%")
	end
	
	# def self.build_search(term)
	# 	search_string = ""
	# 	words = term.split[1..-1]
	# 	words.each do |word|
	# 		search_string += "AND (name ILIKE '%#{word}%' OR neighborhood ILIKE '%#{word}%' OR address ILIKE '%#{word}%')"
	# 	end
	# 	search_string
	# end

	# def self.multi_word_search(term)
	# 	first_term = term.split[0]
	# 	search = "(name ILIKE '%#{first_term}%' OR neighborhood ILIKE '%#{first_term}%' OR address ILIKE '%#{first_term}%')"
	# 	venues = []
	# 	if term.split.length > 1
	# 		more_search = build_search(term)
	# 		venues << Venue.where(search + more_search)
	# 	else
	# 		venues << Venue.where(search)
	# 	end
	# 	venues.flatten.uniq
	# end


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

	def sorted_reviews
		self.reviews.order(:created_at).reverse
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
