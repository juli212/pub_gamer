class UserReportController < ApplicationController
  before_filter :require_login

	def new
		if request.xhr?
			@report = UserReport.new
			@venue = Venue.find_by(id: params[:venue_id])
			@report.venue_id = @venue.id
			render partial: 'new'
		else
			redirect_to venue_path
		end
	end

	def create
		venue = Venue.find_by(id: params[:venue_id])
		@report = UserReport.new
		@report.content = params[:report][:content]
		@report.venue_id = venue.id
		@report.user_id = current_user.id
		if @report.save
			UserMailer.report_venue_inaccurate(@report).deliver_now
		end
		redirect_to venue_path(venue)
	end

end