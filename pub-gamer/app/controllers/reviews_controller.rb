class ReviewsController < ApplicationController

  def create
    @review = Review.new()
    rerender venue_path(@review.venue_id)
  end

private
  def review_params
    params.require(:review).permit(:content, :vibe, :time_visited, :recommended)
  end
end
