class VenueGame < ActiveRecord::Base
	belongs_to :game
	belongs_to :venue
end
