class EventGame < ActiveRecord::Base
	belongs_to :event 
	belongs_to :game

	validates :game_id, :event_id, presence: true
end
	