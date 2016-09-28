class VenueGame < ActiveRecord::Base
	belongs_to :game
	belongs_to :venue

	validates :game_id, :venue_id, presence: true
	validates_uniqueness_of :game_id, :scope => :venue_id
end
