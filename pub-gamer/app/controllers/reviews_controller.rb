class ReviewsController < ApplicationController

	def create
		@review = Review.new(review_params)
		venue = Venue.find_by(id: params[:venue_id])
		binding.pry
		if request.xhr?
			render partial: 'reviews/index', locals: { reviews: venue.reviews }
		else
			redirect_to venue_path(@venue)
		end
	end

	private
	def review_params
		params.require(:review).permit(:content, :vibe, :time_visited, :recommended)
	end
end
