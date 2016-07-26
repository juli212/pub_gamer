class ReviewsController < ApplicationController

	def create
		@review = Review.new(review_params)
		binding.pry
		@review.venue_id = params[:venue_id]
		venue = Venue.find_by(id: params[:venue_id])
		@review.user_id = current_user.id
		vibes = Vibe.find(params[:review][:vibes]) if params[:review][:vibes]
		if @review.save && request.xhr?
<<<<<<< 3840b2dad8094564896057fa0c404bce8e59b2eb
			@review.vibes = vibes if vibes
=======
		binding.pry
>>>>>>> update review vibes to select multiple vibes
			render partial: 'reviews/show', locals: { review: @review }
			@review = Review.new(review_params)
			@current_rating = venue.avg_rating
		elsif @review.save
<<<<<<< 3840b2dad8094564896057fa0c404bce8e59b2eb
			@review.vibes = vibes if vibes
=======
		binding.pry
>>>>>>> update review vibes to select multiple vibes
			redirect_to venue_path(venue)
		else
		binding.pry
			@errors = @review.errors.full_messages
			render partial: 'reviews/new'
		end
	end

	private
	def review_params
<<<<<<< fc8d36877e7ca25c71eac23d13260c133b5bd259
<<<<<<< 3840b2dad8094564896057fa0c404bce8e59b2eb
		params.require(:review).permit(:content, :rating, :week, :venue_id)
=======
		params.require(:review).permit(:content, :rating, :venue_id, vibes: [])
>>>>>>> update review vibes to select multiple vibes
=======
		params.require(:review).permit(:content, :rating, :week, :venue_id)
>>>>>>> add week field to review table
	end

end
