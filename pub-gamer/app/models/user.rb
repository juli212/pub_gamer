class User < ActiveRecord::Base
  has_secure_password
  
  has_many :reviews
  has_many :user_venues
  has_many :favorites, through: :user_venues, source: :venue

  validates :user_name, :email, :password, presence: true
  validates :email, uniqueness: true

  def has_favorited?(venue)
  	self.favorites.include?(venue)
  end
end
