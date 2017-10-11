class EventsController < ApplicationController
  before_filter :require_login, except: [:index, :dropdown, :results, :search]


  def index
    if !request.xhr?
      @event = Event.new
      @games = Game.all
      if params[:venue_id]
        events = Event.venue_events(params[:venue_id])
      else
        events = Event.future_events
      end
      @events = events.paginate(:page => params[:page], :per_page => 12)
    end
  end


  def update_games
    games = Venue.find_by(id: params[:event][:venue_id]).games
    if request.xhr?
      render partial: 'events/event_create_games', locals: { games: games }
    end
  end


  def dropdown
    @search_term = params[:term] if params[:term]
    respond_to do |format|
      format.json {
        @results = Event.future_events.search(@search_term) + Game.game_search(@search_term) + Neighborhood.neighborhood_search(@search_term)
      }
    end
  end


  def results
    if request.xhr? && params[:term]
      events = Event.future_events.search(params[:term])
    else
      events = Event.future_events.sample(15)
    end
    respond_to do |format|
      format.json {
        @events = events
        render json: @events, :include => {:venue=> {:only => [ :id, :name, :address, :lat, :lng ] }}, :only => [:id, :title], :methods => [:startdate, :starttime]
      }
    end
  end


  def search
    @event = Event.new
    if params[:term]
      @search_term = params[:term]
      respond_to do |format|
        format.html { @events = Event.future_events.search(params[:term]).paginate(:page => params[:page], :per_page => 12) }
      end
    else
      @events = Event.paginate(:page => params[:page], :per_page => 12)
    end
  end


  def add_venue
    respond_to do |format|
      format.json { @results = Venue.venue_name_search(params[:term]) }
    end
  end


  def new
    @event = Event.new
    @games = Game.all.sample(10)
  end


  def create
    if !request.xhr?
      @event = Event.new(event_params)
      @event.user_id = current_user.id
      games = params[:games]
      @event.title.gsub("&","and").gsub(/[^\d\sa-zA-Z_\.\,\-\+\!\?]/, "")
      if @event.in_future? && @event.save
        games != nil ? @event.games << Game.find(games) : @event.games = @event.games
        redirect_to event_path(@event)
      else
        @errors = @event.errors.full_messages
        @games = Game.all
        @events = Event.paginate(:page => params[:page], :per_page => 12)
        redirect_to :back, flash: { error: @errors }
      end
    else
      redirect_to events_path
    end
  end


  def edit
    @event = Event.find_by(id: params[:id])
    @games = @event.games
    if request.xhr?
      if @event.user == current_user
        render partial: 'event_create_form', locals: { event: @event }
      end
    else
      redirect_to event_path(@event)
    end
  end


  def guests
    @event = Event.find_by(id: params[:event_id])
    if @event.deleted || !request.xhr?
      redirect_to events_path
    else
      @user = current_user
      @event.update_guest_status(@user) unless @event.user == @user
      @guests = @event.guests.length
      @comment = Comment.new
      if params[:partial] == 'guest_index'
        respond_to do |format|
          format.js { render :partial => "guest_index" }
        end
      elsif params[:partial] == 'guest_show'
        respond_to do |format|
          format.js { render :partial => "guest_show" }
        end
      end
    end
  end


  def cancel
    @event = Event.find_by(id: params[:event_id])
    if request.xhr?
      if current_user == @event.user && @event.in_future?
        @event.update_attribute('deleted', true)
        render partial: 'cancelled'
      end
    end
  end

  
  def update
    @event = Event.find_by(id: params[:id])
    if !request.xhr?
      if @event.deleted == "true"
        errors = ["Event has been cancelled, it cannot be modified"]
        # redirect_to event_path(@event)
      elsif !@event.in_future?
        errors = ["Event date has already passed, it cannot be modified"]
      else
        games = params[:games]
        venue = Venue.find_by(name: params[:event][:location])
        @event.update_attributes(event_params)
        @event.games = Game.find(games)
        @event.venue = venue if @event.venue != venue 
      end
      redirect_to event_path(@event), flash: { error: errors }
    end
  end


  def show
    @event = Event.find_by(id: params[:id])
    if !request.xhr?
      if @event.deleted == true && @event.user != current_user
        redirect_to events_path
      else
        @comments = @event.comments
        @comment = Comment.new
      end
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :date, :time, :description, :limit, :venue_id, :deleted)
  end

end