desc 'send test email'

task :send_test_email => :environment do
	UserMailer.test_email().deliver_now
end