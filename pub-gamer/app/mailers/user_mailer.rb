class UserMailer < ApplicationMailer
	default from: "pubgamerteam@gmail.com"

	def welcome_email(user)
		@user = user
		@url = "http://www.google.com"
		mail(to: @user.email, subject: "testing the welcome")
	end

	def report_venue_inaccurate(report)
		@user = report.user
		@venue = report.venue
		@complaint = report.content
		@venue_url = 'localhost:3000/venues/' + venue.id.to_s
		mail(to: 'pubgamerteam@gmail.com', subject: "INACCURATE VENUE INFO", from: @user.email)
	end
end
