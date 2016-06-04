class UsersController < ApplicationController

  def new

    if request.xhr?
      @user = User.new
      render partial: 'registration_form'
    end

  end
end