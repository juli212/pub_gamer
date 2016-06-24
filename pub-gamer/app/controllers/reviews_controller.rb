class ReviewsController < ApplicationController

	def create
		# binding.pry
		@review = Review.new(review_params)
		@review.venue_id = params[:venue_id]
		venue = Venue.find_by(id: params[:venue_id])
		if params[:recommended] == "yes"
			@review.recommended = true
		end
		if @review.save && request.xhr?
			render partial: 'reviews/show', locals: { reviews: venue.reviews }
		elsif @review.save
			redirect_to venue_path(venue)
		else
			@errors = @review.errors.full_messages
			render partial: 'reviews/new'
		end
	end

	private
	def review_params
		params.require(:review).permit(:content, :vibe, :time_visited, :recommended)
	end
end
