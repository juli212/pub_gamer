class EventsController < ApplicationController

  def index
  	@events = Event.all
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
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    games = params[:games]
    if !(games == nil) && @event.save
      @event.games << Game.find(games)
      redirect_to event_path(@event)
    elsif @event.save
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

  def event_params
    params.require(:event).permit(:title, :event_date, :event_time, :description, :limit, :location, :games => [])
  end

end