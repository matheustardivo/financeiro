# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Financeiro::Application.initialize!

ActionMailer::Base.smtp_settings[:enable_starttls_auto] = false
