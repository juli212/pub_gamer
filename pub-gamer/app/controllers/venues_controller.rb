class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
    @game = Game.new
    @games = Game.all
  end

  def create
    binding.pry
    venue = Venue.new(venue_params)
    if params[:games]
      venue.games << Game.find(params[:games])
    end
    new_game = params[:venue][:game]
    params[:other] && new_game.length > 3 ? venue.make_new(new_game) : venue
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
    params.require(:venue).permit(:name, :address, :description, :place, :other)
  end

end