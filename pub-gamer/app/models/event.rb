class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue

	has_many :comments
	has_many :event_games
	has_many :games, through: :event_games
	has_many :user_events
	has_many :guests, through: :user_events, source: :user

	validates :title, :description, :date, :time, :limit, :location, :user_id, presence: true

	def full?
		self.guests.length >= self.limit
	end

	def in_future?
		self.date > Date.today ||
		(self.date == Date.today && self.time.strftime('%-I').to_i > Time.now.strftime('%-I').to_i) ||
		(self.date == Date.today && self.time.strftime('%-I').to_i == Time.now.strftime('%-I').to_i && self.time.strftime('%-M').to_i > Time.now.strftime('%-M').to_i)
	end

	def sort_events_by_time
		# method to sort by time
	end

	def attending_event?
		#
	end

end
