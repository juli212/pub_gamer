class UserMailer < ApplicationMailer
	default from: "pubgamerteam@gmail.com"

	def welcome_email(user)
		@user = user
		@url = "http://www.google.com"
		mail(to: @user.email, subject: "testing the welcome")
	end
end
