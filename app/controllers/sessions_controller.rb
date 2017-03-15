class SessionsController < ApplicationController

  def new
    if request.xhr?
      render partial: 'login_form'
    else
      redirect_to root_path
    end
  end

  # logs in
  def create
    if !request.xhr?
      user = User.find_by(email: params[:email])
      if user && user.deleted == true
        login_error = ['Inactive User']
        redirect_to root_path, :flash => { :error => login_error }
      elsif user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_profile_path(user)
      else
        login_error = ['Invalid Email or Password']
        redirect_to root_path, :flash => { :error => login_error }
      end
    end
  end

  # logs out
  def destroy
    if !request.xhr?
      session.clear
      redirect_to root_path
    end
  end
end
