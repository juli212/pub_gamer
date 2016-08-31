class EventsController < ApplicationController

  def index
    # binding.pry
    @created_events = Event.where("user_id = #{current_user.id}")
    # if params[:query]
    #   @events = Event.search(params[:query])
    # else
    # end
      @events = Event.paginate(:page => params[:page], :per_page => 8)
    @attended_events = []
    @events.each do |event|
      if event.attending_event?(current_user)
        @attended_events << event
      end
    end
    # if request.xhr?
    #   render partial: 'index_main', locals: { events: @events }
    # end
  end

  def search
    # binding.pry
    respond_to do |format|
      format.html { @events = Event.search(params[:term]).paginate(:page => params[:page], :per_page => 5) }
      format.json { @results = Event.search(params[:term]) + Game.game_search(params[:term]) }
    end
  end

  def show
  	@event = Event.find_by(id: params[:id])
    @comments = @event.comments
    @comment = Comment.new
    render 'show'
  end

  def new
	  @event = Event.new
    @games = Game.all
    if request.xhr?
      render partial: '/events/event_create'
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    games = params[:games]
    if !(games == nil) && @event.in_future?
      @event.save
      @event.games << Game.find(games)
      redirect_to event_path(@event)
    elsif @event.in_future?
      @event.save
      redirect_to event_path(@event)
  	else
      @event = @event
      @games = Game.all
  	  @errors = @event.errors.full_messages
      render 'new'
  	end
  end

  # def edit
  # 	# if !logged_in?
  # 	  redirect_to events_path
  # 	# else
  # 	  @user = User.find_by(id: session[:user_id])
  # 	  @event = Event.find_by(id: params[:id])
  # 		if @user.id == @event.user_id
  # 		end
  # 	# end
  # end

  def update
    @event = Event.find_by(id: params[:id])
    @event.guests << current_user unless @event.full?
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.guests.delete(current_user)
    redirect_to event_path(@event)
  end

  def search_events
    @query ="%#{params[:query]}%"
    @favorites = current_user.favorites
    @events = Event.where("title ilike ? or location ilike ? or description ilike ?", @query, @query, @query)
    @created_events = Event.where("user_id = #{current_user.id}")
    @attended_events = []
    @events.each do |event|
      if event.attending_event?(current_user)
        @attended_events << event
      end
    end
    render 'index'
  end

  def event_params
    params.require(:event).permit(:title, :date, :time, :description, :limit, :location, :games => [])
  end

end