class UserReport < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue

	validates :user_id, :venue_id, :content, :topic, :status, presence: true
	enum topic: [ :inquiry, :inaccuracy, :other ]
	enum status: [ :unchecked, :progressing, :fixed, :unknown ]
end
