class Review < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user

  def review_date
  	date = self.created_at.strftime("%a, %B %d, %Y")
  	"Reviewed: " + date
  end
end
