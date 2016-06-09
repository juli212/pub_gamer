class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
    @games = Game.all
  end

  def create
    venue = Venue.new(venue_params)
    games = params[:games]
    venue.games << Game.find(games)
    if venue.save
      redirect_to venues_path
    else
      @errors = @venue.errors.full_messages
      render 'new'
    end
  end

  def show
    @venue = Venue.find_by(id: params[:id])
    @review = Review.new
    render 'show'
  end

private

  def venue_params
    params.require(:venue).permit(:name, :address)
  end

end