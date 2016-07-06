class SessionsController < ApplicationController

  def new
    if request.xhr?
      render partial: 'login_form'
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ['Invalid Email or Password']
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end