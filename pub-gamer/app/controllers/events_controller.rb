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

  def add_games
    respond_to do |format|
      format.json { @results = Game.game_search(params[:term]) }
    end
  end

  def new
    @event = Event.new
    @games = Game.all
    # if request.xhr?
    #   render partial: '/events/event_create'
    # end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    games = params[:games]
    if @event.in_future? && @event.save
      games != nil ? @event.games << Game.find(games) : @event.games = @event.games
      binding.pry
      # redirect_to :back
      redirect_to event_path(@event)
    else
      @errors = @event.errors.full_messages
      @games = Game.all
      @events = Event.paginate(:page => params[:page], :per_page => 12)
      redirect_to :back
    end
  end

  def edit
    binding.pry
    @event = Event.find_by(id: params[:id])
    @games = @event.games
    if @event.user == current_user && request.xhr?
      render partial: 'event_create_form', locals: { event: @event }
    elsif @event.user == current_user
      render 'edit'
    else
      redirect_to event_path(@event)
    end
  end

  def update
    # binding.pry
    @event = Event.find_by(id: params[:id])
    if @event.deleted == "true"
      @errors = ["Event has been cancelled, it cannot be modified"]
      redirect_to event_path(@event)
    elsif !@event.in_future?
      @errors = ["Event date has already passed, it cannot be modified"]
    elsif params[:act] == "join"
      @event.guests << current_user unless ( @event.full? ) || ( @event.guests.include?(current_user) ) || ( @event.user == current_user )
      redirect_to event_path(@event)
    elsif params[:act] == "leave"
      @event.guests.delete(current_user) if @event.guests.include?(current_user)
      redirect_to events_path
    elsif params[:act] == "delete" && @event.user == current_user
      @event.update_attribute('deleted', true)
      redirect_to events_path
    else
      @event.update_attributes(event_params)
      @event.games = []
      @event.games << Game.find(params[:games])
      venue = Venue.find_by(name: params[:event][:location])
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

  # def search_events
  #   @query ="%#{params[:query]}%"
  #   @favorites = current_user.favorites
  #   @events = Event.where("title ilike ? or location ilike ? or description ilike ?", @query, @query, @query)
  #   @created_events = Event.where("user_id = #{current_user.id}")
  #   @attended_events = []
  #   @events.each do |event|
  #     if event.attending_event?(current_user)
  #       @attended_events << event
  #     end
  #   end
  #   render 'index'
  # end

  private

  def event_params
    params.require(:event).permit(:title, :date, :time, :description, :limit, :venue_id, :deleted, :games => [])
  end

end