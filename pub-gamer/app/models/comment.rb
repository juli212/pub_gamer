class Comment < ActiveRecord::Base
	belongs_to :event

	def username
		user = User.find_by(id: self.user_id)
		user.user_name
	end
end
