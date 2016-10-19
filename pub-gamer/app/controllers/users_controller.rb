class UsersController < ApplicationController

  def new
    @user = User.new
    if request.xhr?
      render partial: 'registration_form'
    end
  end

  def update
    @venue = Venue.find_by(id: params[:venue])
    @user = current_user
    # prev_num_of_favs = @user.favorites.length
    @user.update_favorites(@venue)
    # if params[:from] == "venue-index" && request.xhr? && @user.favorite_added?(prev_num_of_favs)
    #   render partial: 'venues/favorite_display', locals: { favorite: @venue }
    # elsif request.xhr? && @user.favorite_added?(prev_num_of_favs)
    #   render partial: 'users/favorite_added'
    # elsif request.xhr? && @user.favorite_removed?(prev_num_of_favs)
    #   render partial: 'users/favorite_removed'
    # else
    #   redirect_to venue_path(@venue)
    # end
    if params[:act] == "remove" && request.xhr?
      render partial: 'users/favorite_removed'
    elsif params[:act] == "remove"
      redirect_to venues_path
    elsif params[:act] == "add" && request.xhr?
      render partial: 'users/favorite_added'
    elsif params[:act] == "add"
      redirect_to venue_path(@venue)
    else
    redirect_to venue_path(@venue)
    end 
  end

  def show
    @user = User.find_by(id: params[:id])
    if logged_in? && current_user == @user
      @favorites = @user.favorites
      @created_events = @user.created_events
      @upcoming_events = @user.events
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private

  def user_params
      params.require(:user).permit(:user_name,:email,:password, :venue)
  end
end