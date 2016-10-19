require 'will_paginate/array'
class VenuesController < ApplicationController
  before_filter :require_login
# skip_before_action :verify_authenticity_token, only: [:create]
  # autocomplete: :venue, :name

  # def index
  #   binding.pry
  #   @favorites = current_user.favorites
  #   if params[:query]
  #     @venues = Venue.search(params[:query])
  #     if @venues.length == 1 && @venues.first.name == params[:query]
  #       redirect_to venue_path(@venues.first)
  #     elsif request.xhr?
  #       render partial: 'index_main', locals: { venues: @venues }
  #     end
  #   else
  #     @venues = Venue.all
  #     if request.xhr?
  #       render partial: 'index_main', locals: { venues: @venues }
  #     end
  #   end
  # end

  def index
    @favorites = current_user.favorites
    # binding.pry
    @venues = Venue.paginate(:page => params[:page], :per_page => 12)
  end

  def search
    @favorites = current_user.favorites
    respond_to do |format|
      format.html { 
        venues = Venue.search(params[:term])
        if venues.length == 1 && Venue.find_by(name: params[:term])
          @venue = Venue.find_by(name: params[:term])
          redirect_to venue_path(@venue)
        else
          @venues = venues.paginate(:page => params[:page], :per_page => 12)
        end
         }
      format.json { @results = Venue.search(params[:term]) + Game.game_search(params[:term]) + Neighborhood.neighborhood_search(params[:term]) }
    end
  end

  def add_games
    if params[:venue]
      game = Game.find_or_create_by(name: params[:venue][:game].downcase)
      render partial: 'add_game', locals: { game: game }
    else
      respond_to do |format|
        format.json { @results = Game.add_to_venue(params[:term]).sort_by { |game| game.name } }
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
    binding.pry
    @venue = Venue.new(venue_params)
    @venue.neighborhood = Neighborhood.find_or_create_by(name: params[:venue][:neighborhood].titleize)
    if @venue.save
      if params[:venue][:games]
        @venue.games << Game.find(params[:venue][:games])
      end
      # new_game_array = params[:venue][:game].split(',')
      # new_game_array = new_game_array.map(&:lstrip)
      # if new_game_array.length > 0
      #   new_game_array.each do |game|
      #     game_obj = Game.find_or_create_by(name: game)
      #     @venue.games << game_obj
      #   end
      # end
      redirect_to venue_path(@venue)
    else
      @games = Game.all
      @errors = @venue.errors.full_messages
      render 'new'
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
    @venue = Venue.find_by(id: params[:id])
    @reviews = @venue.show_reviews.paginate(:page => params[:page], :per_page => 6)
    @review = Review.new
    @games = @venue.games.limit(6).uniq
    @event = Event.new
    @vibes = Vibe.all
    @current_rating = @venue.avg_rating
    render 'show'
  end

  # def search_venues
  #   @query ="%#{params[:query]}%"
  #   @favorites = current_user.favorites
  #   @venues = Venue.where("name ilike ? or address ilike ? or description ilike ?", @query, @query, @query)
  #   render 'index'
  # end

private

  def venue_params
    params.require(:venue).permit(:name, :address, :place, :other, :games)
  end

end