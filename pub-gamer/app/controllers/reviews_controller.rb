class ReviewsController < ApplicationController

	def create
		binding.pry
		@review = Review.new(review_params)
		binding.pry
		@review.venue_id = params[:venue_id]
		venue = Venue.find_by(id: params[:venue_id])
		@review.user_id = current_user.id
		if @review.save && request.xhr?
		binding.pry
			render partial: 'reviews/show', locals: { review: @review }
			@review = Review.new(review_params)
			@current_rating = venue.avg_rating
		elsif @review.save
		binding.pry
			redirect_to venue_path(venue)
		else
		binding.pry
			@errors = @review.errors.full_messages
			render partial: 'reviews/new'
		end
	end

	private
	def review_params
		params.require(:review).permit(:content, :rating, :venue_id, vibes: [])
	end

end
