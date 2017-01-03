class ReviewsController < ApplicationController
	before_filter :require_login
	
	def create
		@venue = Venue.find_by(id: params[:venue_id]) if params[:venue_id]
		if !request.xhr?
			redirect_to venue_path(@venue)
		else
			@review = Review.new(review_params)
			@review.venue_id = @venue.id
			@review.user_id = current_user.id
			vibes = Vibe.find(params[:review][:vibes]) if params[:review][:vibes]
			if @review.save
				respond_to do |format|
					@review.vibes = vibes if vibes
					@current_rating = @venue.avg_rating
					format.js
				end
			else
				@errors = @review.errors.full_messages
				@vibes = Vibe.all
				redirect_to venue_path(@venue), :flash => { notice: @errors }
			end
		end
	end

	def update
		@review = Review.find_by(id:params[:id])
		if request.xhr?
			redirect_to venue_path(@review.venue_id)
		else
			if current_user.id = @review.user_id
				@review.update_attributes(delete_review_params)
				redirect_to venue_path(@review.venue_id)
			end
		end
	end

	def new
		@venue = Venue.find_by(id: params[:venue_id])
		redirect_to venue_path(@venue)
	end

	def show
		@venue = Venue.find_by(id: params[:venue_id])
		@review = Review.find_by(id: params[:id])
		if request.xhr? && @review.deleted == false
			render partial: 'full_review', locals: { review: @review }
		else
			redirect_to venue_path(@venue)
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