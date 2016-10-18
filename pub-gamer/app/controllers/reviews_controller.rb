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
			@venue = venue
			@vibes = Vibe.all
			render partial: 'reviews/errors'
		end
	end

	def update
		binding.pry
		@review = Review.find_by(id:params[:id])
		if current_user.id = @review.user_id
			@review.update_attributes(delete_review_params)
			redirect_to venue_path(@review.venue_id)
		end
	end

	def new
	end

	def show
		@venue = Venue.find_by(id: params[:venue_id])
		@review = Review.find_by(id: params[:id])
		if request.xhr?
			render partial: 'full_review', locals: { review: @review }
		else
			render 'show'
		end
	end

	private
	def review_params
		params.require(:review).permit(:content, :rating, :week, :venue_id)
	end

	def delete_review_params
		params.require(:review).permit(:deleted)
	end

end