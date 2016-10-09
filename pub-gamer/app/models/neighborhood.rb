class Neighborhood < ActiveRecord::Base
	has_many :venues
	has_many :events, through: :venues

	validates :name, presence: true
	validates :name, uniqueness: true

	def self.neighborhood_search(term)
		where("name ILIKE :term", term: "%#{term.downcase}%")
	end

	def self.add_to_venue(term)
		where("name ILIKE :term", term: "#{term.downcase}%")
	end

	def search_location
		""
	end

	def search_address
		""
	end
end
