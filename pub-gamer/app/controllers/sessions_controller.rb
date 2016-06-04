class SessionsController < ApplicationController

  def new
    if request.xhr?
      render partial: 'sessions/login_form'
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to events_path
    else
      @errors = ['Invalid Email or Password']
      render 'new'
    end
  end

end