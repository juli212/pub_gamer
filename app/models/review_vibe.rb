class ReviewVibe < ActiveRecord::Base
	belongs_to :review
	belongs_to :vibe
end
