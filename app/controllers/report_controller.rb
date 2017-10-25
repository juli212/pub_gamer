class ReportController < ApplicationController
  before_filter :require_login, except: [:new_inquiry, :create]

	def new_inaccuracy
		if request.xhr?
			@report = Report.new
			@report.venue_id = params[:format]
			@report.topic = 2
			render partial: 'new_inaccuracy'
		end
	end

	def new_inquiry
		if request.xhr?
			@report = Report.new
			@report.topic = 1
			render partial: 'new_inquiry'
		end
	end

	def create
		@report = Report.new(report_params)
		@report.user_id = current_user.id if current_user
		if @report.save && @report.topic == "inquiry"
			UserMailer.contact_us(@report).deliver_now
			redirect_to contact_index_path, flash: { notice: [ "Message sent"] }
		elsif @report.save && @report.topic == "inaccuracy"
			UserMailer.report_venue_inaccurate(@report).deliver_now
			redirect_to venue_path(@report.venue), flash: { notice: [ "Message sent"] }
		else
			@report = @report
			flash[:error] = ["Error sending message"]
			render 'contact/index'
		end
	end

private
	
	def report_params
		params.require(:report).permit(:topic, :content, :name, :email, :venue_id)
	end

end