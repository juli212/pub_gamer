class UserMailer < ApplicationMailer
	default from: "pubgamerteam@gmail.com"

	def welcome_email(user)
		@user = user
		@url = "http://pub-gamer.herokuapp.com"
		mail(to: @user.email, subject: "Welcome To PubGamer!", from: 'pubgamerteam@gmail.com')
	end

	def report_venue_inaccurate(report)
		@user = report.user
		@venue = report.venue
		@complaint = report.content
		@venue_url = 'http://pub-gamer.herokuapp.com/venues/' + @venue.id.to_s
		mail(to: 'pubgamerteam@gmail.com', subject: "INACCURATE VENUE INFO", from: @user.email)
	end

	def contact_us(report)
		@report = report
		@message = report.content
		@date = DateTime.now
		mail(to: 'pubgamerteam@gmail.com', subject: "GENERAL CONTACT", from: @report.email)
	end
end
