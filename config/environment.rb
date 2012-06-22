# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HaxxorNews::Application.initialize!

[Date, Time, DateTime].each {|klass| klass::DATE_FORMATS[:custom_date] = "%D at %l:%M%p"}


