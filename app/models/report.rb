class Report < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue

	validates :content, :topic, :status, presence: true
	enum topic: [ :other, :inquiry, :inaccuracy]
	enum status: [ :unknown, :unchecked, :progressing, :finished ]

end
