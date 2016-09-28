class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue
	belongs_to :neighborhood

	has_many :comments
	has_many :event_games
	has_many :games, through: :event_games
	has_many :user_events
	has_many :guests, through: :user_events, source: :user

	validates :title, :description, :date, :time, :limit, :venue_id, :user_id, presence: true

	def name
		self.title
	end

	def location
		# self.venue.name
	end

	def address
		# self.venue.address
	end

	def search_location
		" - " + self.venue.name
	end

	def self.search(term)
		events = Event.event_search(term) + Event.event_venue_search(term) + Event.game_search(term) + Event.multi_word_search(term)
		events.uniq
	end

	def self.multi_word_search(term)
		words = term.split.join(' & ')
		joins(:games).joins(:venue).where("to_tsvector(events.title || ' ' || events.description || ' ' || games.name || ' ' || venues.name || ' ' || venues.neighborhood) @@ to_tsquery('#{words}')")
	end

	def self.event_venue_search(term)
		joins(:venue).where("venues.name ILIKE :term OR venues.address ILIKE :term OR venues.neighborhood ILIKE :term", term: "%#{term.downcase}%").uniq
	end
	
	def self.game_search(term)
		joins(:games).where("games.name ILIKE :term", term: "%#{term.downcase}%").uniq
	end

	def self.event_search(term)
		where("title ILIKE :term OR description ILIKE :term", term: "%#{term.downcase}%")
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
