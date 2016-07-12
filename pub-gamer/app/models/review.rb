class Review < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user

  validates :content, :vibe, :venue_id, :user_id, presence: true

  def review_date
  	date = self.created_at.strftime("%a, %B %d, %Y")
  	"Reviewed: " + date
  end
end
