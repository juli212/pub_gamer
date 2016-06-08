class ReviewsController < ApplicationController

  def create
    @review = Review.new()
  end

private
  def review_params
    params.require(:venue).permit(:name, :description, :address, :neighborhood)
  end

end