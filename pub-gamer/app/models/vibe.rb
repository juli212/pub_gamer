class Vibe < ActiveRecord::Base
	has_many :review_vibes
	has_many :reviews, through: :review_vibes

	validates :name, presence: true
	validates :name, uniqueness: true
end
