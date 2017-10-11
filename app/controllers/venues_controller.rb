require 'will_paginate/array'
class VenuesController < ApplicationController
  before_filter :require_login, except: [:index, :dropdown, :results, :search]
# skip_before_action :verify_authenticity_token, only: [:create]

  def index
    if !request.xhr?
      @venues = Venue.paginate(:page => params[:page], :per_page => 12)
    end
  end

  def dropdown
    @search_term = params[:term] if params[:term]
    respond_to do |format|
      format.json {
        @results = Venue.search(@search_term) + Game.game_search(@search_term) + Neighborhood.neighborhood_search(@search_term)
      }
    end
  end

  def results
    if request.xhr? && params[:term]
      venues = Venue.search(params[:term])
    else
      venues = Venue.all.sample(15)
    end
    respond_to do |format|
      format.json {
        @venues = venues
        render json: @venues, :only => [:id, :name, :address, :lat, :lng]
      }
    end
  end

  def search
    if params[:term]
      @search_term = params[:term]
      venues = Venue.search(@search_term)
      respond_to do |format|
        format.html { 
          @venues = venues.paginate(:page => params[:page], :per_page => 12)
        }
      end
    else
      @venues = Venue.paginate(:page => params[:page], :per_page => 12)
    end
  end

  def add_games
      game = Game.find_or_create_by(name: params[:venue][:game].downcase)
    if params[:venue][:exists] == "yes"
      venue = Venue.find_by(id: params[:venue][:id])
      if !venue.games.include?(game)
        venue.games << game
        render partial: '/shared/add_game_to_show', locals: { game: game }
      end
    end
  end

  def add_neighborhood
    respond_to do |format|
      format.json { @results = Neighborhood.add_to_venue(params[:term]).sort_by { |neighborhood| neighborhood.name } }
    end
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if !request.xhr?
      @venue.neighborhood = Neighborhood.find_or_create_by(name: params[:venue][:neighborhood].titleize)
      @venue.name = @venue.name.gsub("&","and").gsub(/[^\d\sa-zA-Z_\.\,\-\+\!\?]/,'')
      if @venue.save
        if params[:games]
          @venue.games << Game.find(params[:games])
        end
        redirect_to venue_path(@venue)
      else
        @games = Game.all
        @errors = @venue.errors.full_messages
        redirect_to new_venue_path, flash: { error: @errors }
      end
    else
      redirect_to new_venue_path
    end
  end

  def update
    if request.xhr?
      venue = Venue.find_by(id: params[:id])
      @current_rating = venue.avg_rating
      render partial: '/venues/venue_rating', locals: { current_rating: @current_rating }
    end
  end

  def show
    if !request.xhr?
      @venue = Venue.find_by(id: params[:id])
      @reviews = @venue.show_reviews.paginate(:page => params[:page], :per_page => 12)
      @review = Review.new
      @games = @venue.games
      @event = Event.new
      @vibes = Vibe.all
      @current_rating = @venue.avg_rating
    end
  end

private

  def venue_params
    params.require(:venue).permit(:name, :address, :place, :lat, :lng, :other, :games)
  end

end