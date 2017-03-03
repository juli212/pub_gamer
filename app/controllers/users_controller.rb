class UsersController < ApplicationController
  require 'resolv-replace'
  
  def events
    user = User.find_user(params)
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
    @user = User.find_user(params)
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
    @user = User.find_user(params)
    if @user == current_user && !request.xhr?
      @user.update_attribute('deleted', true)
      session.clear
      redirect_to root_path, flash: { error: ["Your profile has been deleted"] }
    elsif @user
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def edit_password
    @user = User.find_user(params)
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
    @user = User.find_user(params)
    if !request.xhr?
      if @user == current_user && @user.authenticate(params[:user][:old_password])
        password = params[:user][:new_password]
        confirmation = params[:user][:password_confirmation]
        flash[:error] = @user.update_password(password, confirmation)
      elsif @user
        flash[:error] = ["Authentication failed"]
      else
        flash[:error] = ["Unknown user"]
      end
      redirect_to user_path(@user)
    end
  end

  def update_favorite
    @user = User.find_user(params)
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
    @user = User.find_user(params)
    if !request.xhr?
      if @user == current_user && @user.authenticate(params[:user][:password])
        @user.update_attributes(user_params)
        if !@user.save
          flash[:error] = @user.errors.full_messages
          @user = User.find_by(id: @user.id)
        end
      else
        flash[:error] = ["Authentication failed"]
      end
      redirect_to user_profile_path(@user)
    end
  end

  def show
    @user = User.find_user(params)
    if !request.xhr? && @user != nil
      if !logged_in? || @user.deleted?
        notice = ["You must be logged in to view page"]
        redirect_to root_path, flash: { :error => notice }
      elsif @user != nil
        @show = "yes"
        @favorites = @user.favorites
        @created_events = @user.created_events
        @upcoming_events = @user.events
      end
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    
    if !request.xhr?
      if @user.save
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver_now
        redirect_to user_profile_path(@user)
      else
        user_errors = @user.errors.full_messages
        redirect_to root_path, :flash => { :error => user_errors }
      end
    end
  end

  private

  def user_params
      params.require(:user).permit(:user_name, :first_name, :last_name, :birthday, :bio, :email, :password, :password_confirmation, :venue, :photo)
  end
end