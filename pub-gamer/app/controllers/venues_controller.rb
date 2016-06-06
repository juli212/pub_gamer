class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def create
    @venue = Venue.new
  end

  def show

  end

end