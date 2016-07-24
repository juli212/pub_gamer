class User < ActiveRecord::Base
  has_secure_password
  
  has_many :reviews
  has_many :user_venues
  has_many :favorites, through: :user_venues, source: :venue
  has_many :user_events
  has_many :events, through: :user_events

  validates :user_name, :email, :password, presence: true
  validates :email, uniqueness: true

  def has_favorited?(venue)
  	self.favorites.include?(venue)
  end

  def has_favorites?
  	!self.favorites.empty?
  end

	def has_upcoming_events?
		!self.events.empty?
	end

	def has_created_events?
		!self.created_events.empty?
	end

	def created_events
		Event.where(user_id: self.id)
	end

	def update_favorites(selected_venue)
		if self.favorites.include?(selected_venue)
			self.favorites.delete(selected_venue)
		else
			self.favorites << selected_venue
		end
	end

	def favorite_added?(prev_num_of_favs)
		self.favorites.length > prev_num_of_favs
	end

	def favorite_removed?(prev_num_of_favs)
		!self.favorite_added?(prev_num_of_favs)
	end
end
