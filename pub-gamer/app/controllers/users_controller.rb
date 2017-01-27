class UsersController < ApplicationController
  require 'resolv-replace'
  
  def events
    user = User.find(params[:user_id])
    if !request.xhr?
      redirect_to user_path(user)
    else
      events = case params[:event]
      when "upcoming"
        user.upcoming_events
      when "created"
        user.created_events
      when "attending"
        user.attending_events
      when "past"
        user.past_events
      end
      render partial: 'display_user_events', locals: { events: events }
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if logged_in? && current_user == @user
      if request.xhr?
        render partial: 'edit_user'
      else
        redirect_to user_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user == current_user && !request.xhr?
      @user.update_attribute('deleted', true)
      session.clear
      redirect_to root_path, flash: { notice: ["Your profile has been deleted"] }
    elsif @user
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def edit_password
    @user = User.find_by(id: params[:user_id])
    if !request.xhr?
      if @user
        redirect_to root_path
      end
    else
      if @user && @user == current_user
        render partial: 'edit_password_form', locals: { user: @user }
      else
        render partial: 'shared/empty'
      end
    end
  end

  def update_password
    @user = User.find_by(id: params[:user_id])
    if !request.xhr?
      if @user == current_user && @user.authenticate(params[:user][:old_password])
        password = params[:user][:new_password]
        confirmation = params[:user][:password_confirmation]
        flash[:notice] = @user.update_password(password, confirmation)
      elsif @user
        flash[:notice] = ["Authentication failed"]
      else
        flash[:notice] = ["Unknown user"]
      end
      redirect_to user_path(@user)
    end
  end

  def update_favorite
    @user = User.find_by(id: params[:user_id])
    if request.xhr?
      if @user == current_user
        respond_to do |format|
          @old_fav_num = @user.favorites.length
          @venue = Venue.find_by(id: params[:venue_id])
          new_fav_num = @user.update_favorites(@venue)
          format.js
        end
      end
    else
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if !request.xhr?
      if @user == current_user && @user.authenticate(params[:user][:password])
        @user.update_attributes(user_params)
      else
        flash[:notice] = ["Authentication failed"]
      end
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if !request.xhr?
      if !logged_in? || @user.deleted?
        notice = ["You must be logged in to view page"]
        redirect_to root_path, flash: { :notice => notice }
      else
        @show = "yes"
        @favorites = @user.favorites
        @created_events = @user.created_events
        @upcoming_events = @user.events
      end
    end
  end

  def create
    @user = User.new(user_params)
    if !request.xhr?
      if @user.save
        session[:user_id] = @user.id
        # UserMailer.welcome_email(@user).deliver_now
        redirect_to user_path(@user)
      else
        @errors = @user.errors.full_messages
        redirect_to root_path, :flash => { :notice => @user.errors.full_messages }
      end
    end
  end

  private

  def user_params
      params.require(:user).permit(:user_name, :first_name, :last_name, :birthday, :bio, :email, :password, :password_confirmation, :venue, :photo)
  end
end