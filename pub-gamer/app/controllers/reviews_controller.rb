class ReviewsController < ApplicationController

	def create
		@review = Review.new(review_params)
		@review.venue_id = params[:venue_id]
		venue = Venue.find_by(id: params[:venue_id])
		@review.user_id = current_user.id
		vibes = Vibe.find(params[:review][:vibes]) if params[:review][:vibes]
		if @review.save && request.xhr?
			@review.vibes = vibes if vibes
			render partial: 'reviews/show', locals: { review: @review }
			@review = Review.new(review_params)
			@current_rating = venue.avg_rating
		elsif @review.save
			@review.vibes = vibes if vibes
			redirect_to venue_path(venue)
		else
			@errors = @review.errors.full_messages
			render partial: 'reviews/new'
		end
	end

	private
	def review_params
		params.require(:review).permit(:content, :rating, :venue_id)
	end

end
