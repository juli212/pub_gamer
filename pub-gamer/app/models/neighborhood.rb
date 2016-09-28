class Neighborhood < ActiveRecord::Base
	has_many :venues
	has_many :events, through: :venues

	validates :name, presence: true
	validates :name, uniqueness: true
end
