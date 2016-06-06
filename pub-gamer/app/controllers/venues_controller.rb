class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venues_path
    else
      @errors = @venue.errors.full_messages
      render 'new'
    end
  end

  def show
    @venue = Venue.find_by(id: params[:id])
    render 'show'
  end

  def venue_params
    params.require(:venue).permit(:name, :description, :address)
  end
end