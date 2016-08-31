class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue

	has_many :comments
	has_many :event_games
	has_many :games, through: :event_games
	has_many :user_events
	has_many :guests, through: :user_events, source: :user

	validates :title, :description, :date, :time, :limit, :location, :user_id, presence: true

	def name
		self.title
	end

	def search_location
		" - " + self.location
	end

	def self.search(term)
		events = Event.event_search(term) + Event.game_search(term)
		events.uniq
	end

	def self.event_search(term)
		where("title ILIKE :term OR description ILIKE :term OR location ILIKE :term", term: "%#{term.downcase}%")
	end

	def self.game_search(term)
		joins(:games).where("games.name ILIKE :term", term: "%#{term.downcase}%").uniq
	end

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


  def attending_event?(current_user)
    if self.guests.length == 0
      return false
    end
    self.guests.each do |guest|
      if guest.id == current_user.id
        return true
      end
    end
    return false
  end


end
