class UsersController < ApplicationController

  def new
    @user = User.new
    if request.xhr?
      render partial: 'registration_form'
    end
  end

  def events
    user = User.find(params[:user_id])
    if params[:event] == "upcoming"
      events = user.upcoming_events
    elsif params[:event] == "created"
      events = user.created_events
    elsif params[:event] == "attending"
      events = user.attending_events
    elsif params[:event] == "past"
      events = user.past_events
    end
    render partial: 'display_user_events', locals: { events: events }
  end

  def edit
    @user = User.find_by(id: params[:id])
    if logged_in? && current_user == @user
      if request.xhr?
        render partial: 'registration_form'
      else
        render 'edit'
      end
    else
      redirect_to root_path
    end
  end

  def delete_profile
    @user = User.find_by(id: params[:user_id])
    if @user == current_user
      @user.update_attribute('deleted', true)
      session.clear
      redirect_to root_path, flash: { notice: "Your profile has been deleted" }
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user == current_user
      if params[:venue]
        @venue = Venue.find_by(id: params[:venue]) 
        @user.update_favorites(@venue)
      end
      if params[:act] == "remove"
        render partial: 'venues/index_add_favorite', locals: { venue: @venue }
      elsif params[:act] == "add"
        render partial: 'venues/index_remove_favorite', locals: { venue: @venue }
      else
        @user.update_attributes(user_params)
        redirect_to user_path(@user)
      end
    else 
      redirect_to user_path(@user)
    end
  end

  def show
    binding.pry
      @user = User.find_by(id: params[:id])
    if !logged_in? || @user.deleted?
      notice = "You must be logged in to view page"
      redirect_to root_path, flash: { :notice => notice }
    else
      @favorites = @user.favorites
      @created_events = @user.created_events
      @upcoming_events = @user.events
    end
  end
    # if logged_in? 
    # else
    #   redirect_to root_path
    # end
    # if @user.deleted?
    #     redirect_to root_path
    # else
    #   # @show = "yes"

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      redirect_to root_path, :flash => { :notice => @user.errors.full_messages }
    end
  end

  private

  def user_params
      params.require(:user).permit(:user_name, :first_name, :last_name, :birthday, :bio, :email, :password, :password_confirmation, :venue, :photo)
  end
end