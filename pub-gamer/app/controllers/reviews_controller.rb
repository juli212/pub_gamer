class ReviewsController < ApplicationController

  def create
    @review = Review.new()
  end

private
  def review_params
    params.require(:review).permit(:content, :vibe, :time_visited, :recommended)
  end
end
