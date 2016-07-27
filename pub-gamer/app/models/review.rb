class Review < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user
  has_many :review_vibes
  has_many :vibes, through: :review_vibes

  validates :content, :venue_id, :user_id, presence: true

  def review_date
  	date = self.created_at.strftime("%a, %B %d, %Y")
  	"Reviewed: " + date
  end
end
