class VenuesController < ApplicationController
# skip_before_action :verify_authenticity_token, only: [:create]
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
    @game = Game.new
    @games = Game.all
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      if params[:venue][:games]
        @venue.games << Game.find(params[:venue][:games])
      end
      new_game = params[:venue][:game]
      params[:other] && new_game.length > 0 ? @venue.make_new(new_game) : @venue
      redirect_to venues_path
    else
      @games = Game.all
      @errors = @venue.errors.full_messages
      render 'new'
    end
  end

  def show
    @venue = Venue.find_by(id: params[:id])
    @review = Review.new
    @current_rating = @venue.avg_rating
    render 'show'
  end

  def search
    # binding.pry
    @query ="%#{params[:query]}%"
    @venues = Venue.where("name ilike ? or address ilike ? or description ilike ?", @query, @query, @query)
    render 'index'
  end

private

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :place, :other, :games)
  end

end