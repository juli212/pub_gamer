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
		events = Event.event_search(term) + Event.event_venue_search(term) + Event.game_search(term) + Event.multi_word_search(term)
		events.uniq
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

	def self.event_index_events
		where("deleted = 'false'" && 'date >= ?', Date.today).order(:date)
	end

	def self.venue_event_index_events(venue_id)
		Event.event_index_events.where('venue_id = ?', venue_id)
	end

	# def self.neighborhood_search(term)
	# 	joins(:venue).joins('JOIN neighborhoods ON neighborhoods.id = venues.neighborhood_id').where("neighborhoods.name ILIKE :term", term: "%#{term.downcase}%")
	# end

	def full?
		self.guests.length >= self.limit
	end

	def open_spots
		self.limit - self.guests.length
	end

	def in_future?
		self.date > Date.today ||
		(self.date == Date.today && self.time.strftime('%-I').to_i > Time.now.strftime('%-I').to_i) ||
		(self.date == Date.today && self.time.strftime('%-I').to_i == Time.now.strftime('%-I').to_i && self.time.strftime('%-M').to_i > Time.now.strftime('%-M').to_i)
	end

	def self.future_events
		where("date >= ?", DateTime.now).order('date ASC, time ASC')
	end

	def self.past_events
		where("date < ?", DateTime.now).order('date DESC, time DESC')
	end

  def attending_event?(user)
    if ( self.guests.empty? ) || ( !self.guests.include?(user) )
      return false
    else
    	return true
    end
  end


end
