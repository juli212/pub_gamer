class EventsController < ApplicationController
  def
    binding.pry
  	@events = Event.all
  end

  def show
  	@event = Event.find_by(id: params[:id])
    render 'show'
  end

  def new
	  @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
  	if @event.save
      redirect_to event_path(@event)
  	else
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

  # def update

  # end

  def destroy

  end

  def event_params
    params.require(:event).permit(:title, :event_date, :event_time, :description, :limit, :location)
  end
end