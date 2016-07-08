class Comment < ActiveRecord::Base
	belongs_to :event

	validates :body, :event_id, :user_id, presence: true
	
	def username
		user = User.find_by(id: self.user_id)
		user.user_name
	end
end
