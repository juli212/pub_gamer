class EventsController < ApplicationController
  before_filter :require_login

  def index
    @event = Event.new
    @games = Game.all
    if params[:venue_id]
      events = Event.venue_event_index_events(params[:venue_id])
    else
      events = Event.event_index_events
    end
    @events = events.paginate(:page => params[:page], :per_page => 12)
  end

  def update_games
    games = Venue.find_by(id: params[:event][:venue_id]).games
    if request.xhr?
      render partial: 'events/event_create_games', locals: { games: games }
    end
  end

  def search
    @event = Event.new
    respond_to do |format|
      format.html { @events = Event.future_events.search(params[:term]).paginate(:page => params[:page], :per_page => 12) }
      format.json { @results = Event.future_events.search(params[:term]) + Game.game_search(params[:term]) + Neighborhood.neighborhood_search(params[:term]) }
    end
  end

  def add_venue
    respond_to do |format|
      format.json { @results = Venue.venue_name_search(params[:term]) }
    end
  end

  def new
    @event = Event.new
    @games = Game.sample(5)
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    games = params[:games]
    if @event.in_future? && @event.save
      games != nil ? @event.games << Game.find(games) : @event.games = @event.games
      redirect_to event_path(@event)
    else
      @errors = @event.errors.full_messages
      @games = Game.all
      @events = Event.paginate(:page => params[:page], :per_page => 12)
      redirect_to :back
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
    @games = @event.games
    if @event.user == current_user
      render partial: 'event_create_form', locals: { event: @event }
    else
      redirect_to event_path(@event)
    end
  end

  def guests
    @event = Event.find_by(id: params[:event_id])
    if @event.deleted
      redirect_to events_path
    else
      respond_to do |format|
        @user = current_user
        @event.update_guest_status(@user) unless @event.user == @user
        @guests = @event.guests.length
        format.js
      end
    end
  end

  def cancel
    # binding.pry
    @event = Event.find_by(id: params[:event_id])
    if current_user == @event.user
      @event.update_attribute('deleted', true)
      render partial: 'cancelled'
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    if @event.deleted == "true"
      @errors = ["Event has been cancelled, it cannot be modified"]
      redirect_to event_path(@event)
    elsif !@event.in_future?
      @errors = ["Event date has already passed, it cannot be modified"]
    else
      games = params[:games]
      venue = Venue.find_by(name: params[:event][:location])
      @event.update_attributes(event_params)
      @event.games = Game.find(games)
      @event.games = []
      @event.games << Game.find(params[:event][:games])
      @event.venue = venue if @event.venue != venue 
      redirect_to event_path(@event)
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event.deleted == true && @event.user != current_user
    # if @event.deleted == true redirect_to events_path unless @event.user == current_user
      redirect_to events_path
    else
      @comments = @event.comments
      @comment = Comment.new
      render 'show'
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :date, :time, :description, :limit, :venue_id, :deleted)
  end

end