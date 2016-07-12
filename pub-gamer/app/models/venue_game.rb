class VenueGame < ActiveRecord::Base
	belongs_to :game
	belongs_to :venue

	validates :game_id, :venue_id, presence: true
end
