class EventsController < ApplicationController
  before_filter :require_login

  def index
    # binding.pry
    @event = Event.new
    @games = Game.limit(6)
    @events = Event.paginate(:page => params[:page], :per_page => 8)
    # @attended_events = []
    # @events.each do |event|
    #   if event.attending_event?(current_user)
    #     @attended_events << event
    #   end
    # end
    # if request.xhr?
    #   render partial: 'index_main', locals: { events: @events }
    # end
  end

  def update_games
    # binding.pry
    games = Venue.find_by(id: params[:event][:venue_id]).games
    if request.xhr?
      render partial: 'events/event_create_games', locals: { games: games }
    end
  end

  def search
    @event = Event.new
    respond_to do |format|
      format.html { @events = Event.search(params[:term]).paginate(:page => params[:page], :per_page => 5) }
      format.json { @results = Event.search(params[:term]) + Game.game_search(params[:term]) + Neighborhood.neighborhood_search(params[:term]) }
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
    @games = Game.limit(6)
    # if request.xhr?
    #   render partial: '/events/event_create'
    # end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    games = params[:games]
    if @event.in_future? && @event.save
      !(games == nil) ? @event.games << Game.find(games) : @event.games = nil
      redirect_to event_path(@event)
    else
      @errors = @event.errors.full_messages
      @games = Game.all
      @events = Event.paginate(:page => params[:page], :per_page => 8)
      # redirect_to :back
      render 'index'
    end
  end
   #  if !(games == nil) && @event.in_future?
   #    @event.save
   #    @event.games << Game.find(games)
   #    redirect_to event_path(@event)
   #  elsif @event.in_future?
   #    @event.save
   #    redirect_to event_path(@event)
    # else
   #    @event = @event
   #    @games = Game.all
    #   @errors = @event.errors.full_messages
   #    render 'new'
    # end

  # def edit
  #   # if !logged_in?
  #     redirect_to events_path
  #   # else
  #     @user = User.find_by(id: session[:user_id])
  #     @event = Event.find_by(id: params[:id])
  #     if @user.id == @event.user_id
  #     end
  #   # end
  # end

  def update
    @event = Event.find_by(id: params[:id])
    if params[:act] == "join"
      @event.guests << current_user unless ( @event.full? ) || ( @event.guests.include?(current_user) )
      redirect_to event_path(@event)
    elsif params[:act] == "leave"
      @event.guests.delete(current_user)
      redirect_to events_path
    end
  end

  def destroy
    # redirect_to event_path(@event)
  end

  def show
  	@event = Event.find_by(id: params[:id])
    @comments = @event.comments
    @comment = Comment.new
    render 'show'
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
    params.require(:event).permit(:title, :date, :time, :description, :limit, :venue_id, :games => [])
  end

end