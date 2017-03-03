class Comment < ActiveRecord::Base
	belongs_to :event

	validates :body, :event_id, :user_id, presence: true
  validates_length_of :body, maximum: 300, message: "over character limit"
	
	def username
		user = User.find_by(id: self.user_id)
		user.user_name
	end

	def comment_date
		"posted " + self.created_at.strftime('%b %d %-I:%M%P')
	end
end
