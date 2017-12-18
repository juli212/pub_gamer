# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 1.days do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

<<<<<<< 9b3603c7b70a4e6454cd1c33abe00d0f94950d78
every :day, at: '6:10 pm' do
	runner UserMailer.test_email().deliver_now
=======
every :day, at: '6:30 pm' do
	rake "send_test_email"
>>>>>>> add daily email test rake task
end