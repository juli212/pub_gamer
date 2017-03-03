class WelcomeController < ApplicationController

  def index
  	if logged_in?
  		redirect_to user_profile_path(current_user)
  	else
  		@user = User.new
  	end
	end

end