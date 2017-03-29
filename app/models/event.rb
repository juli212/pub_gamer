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
	validates_inclusion_of :limit, in: 0..40
	validates_length_of :title, maximum: 100, message: "over character limit"
	validates_length_of :description, maximum: 500, message: "over character limit"
	validates :title, format: {
		with: /\A[\d\sa-zA-Z_\.\,\-\+\!\?]+\z/,
		message: "Invalid characters: Acceptable characters are A-Z, a-z, 0-9"
	}


	def game
	end

	def name
		self.title
	end

	def location
		self.venue ? self.venue.name : ""
	end

	def address
		self.venue ? self.venue.address : ""
	end

	def search_location
		" - " + self.venue.name
	end

	def self.search(term)
		term = term.gsub(/[^\d\sa-zA-Z_\.\,\-\+\!\?]/, "")
		events = Event.event_search(term) + Event.event_venue_search(term) + Event.game_search(term) + Event.multi_word_search(term)
		events.uniq
	end

	def startdate
		self.date.strftime('%a %b %d, %Y')
	end

	def starttime
		self.time.strftime('%-I:%M%p')
	end

	def place
		self.venue.place
	end

	def self.multi_word_search(term)
		words = term.split.join(' & ')
		joins(:games).joins(:venue).joins('JOIN neighborhoods ON neighborhoods.id = venues.neighborhood_id').where("to_tsvector(events.title || ' ' || events.description || ' ' || games.name || ' ' || venues.name || ' ' || neighborhoods.name) @@ to_tsquery('#{words}')").uniq
	end

	def self.event_venue_search(term)
		joins(:venue).joins('JOIN neighborhoods ON neighborhoods.id = venues.neighborhood_id').where("venues.name ILIKE :term OR venues.address ILIKE :term OR neighborhoods.name ILIKE :term", term: "%#{term.downcase}%").uniq
	end
	
	def self.game_search(term)
		joins(:games).where("games.name ILIKE :term", term: "%#{term.downcase}%").uniq
	end

	def self.event_search(term)
		where("title ILIKE :term OR description ILIKE :term", term: "%#{term.downcase}%").uniq
	end

	def self.future_events
		where("events.deleted = ? AND date >= ?", :false, Date.today).order(:date, :time)
	end

	def self.past_events
		where("date < ?", DateTime.now).order('date DESC, time DESC')
	end

	def self.venue_events(venue_id)
		Event.future_events.where('venue_id = ?', venue_id)
	end

	def full?
		self.guests.length >= self.limit
	end

	def open_spots
		self.limit - self.guests.length
	end

	def in_past?
		self.date < Date.today
	end

	def in_future?
		self.date >= Date.today
	end

  def attending_event?(user)
    if ( self.guests.empty? ) || ( !self.guests.include?(user) )
      return false
    else
    	return true
    end
  end

  def update_guest_status(user)
  	if attending_event?(user)
  		leave(user)
  	else
  		join(user)
  	end
  end

  def leave(user)
  	guests.delete(user)
  end

  def join(user)
  	guests << user unless self.user == user
  end

  def split_description
  	self.description.split(/\r\n/)
  end

end
