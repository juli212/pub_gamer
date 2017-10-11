class ContactController < ApplicationController
	def index
		@report = Report.new
		@report.topic = 1
		if logged_in?
			@report.email = current_user.email
			@report.name = current_user.full_name
		else
			
		end
	end
end