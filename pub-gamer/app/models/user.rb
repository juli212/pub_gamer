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
  
end
