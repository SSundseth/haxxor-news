# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HaxxorNews::Application.initialize!

[Date, Time, DateTime].each {|klass| klass::DATE_FORMATS[:custom_date] = "%D at %l:%M%p"}


ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 25,
  :user_name => "mail.haxxornews@gmail.com",
  :password => "catcher62891",
  :authentication => :login
}



