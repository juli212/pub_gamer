class Neighborhood < ActiveRecord::Base
	has_many :venues
	has_many :events, through: :venues

	validates :name, presence: true
	validates :name, uniqueness: true
	validates_length_of :name, maximum: 30, message: "over character limit"

	def self.neighborhood_search(term)
		term = term.gsub(/[^\d\sa-zA-Z_\.\,\-\+\!\?]/, "")
		where("name ILIKE :term", term: "%#{term.downcase}%")
	end

	def self.add_to_venue(term)
		term = term.gsub(/[^\d\sa-zA-Z_\.\,\-\+\!\?]/, "")
		where("name ILIKE :term", term: "#{term.downcase}%")
	end

	def search_location
		""
	end

	def search_address
		""
	end
end
