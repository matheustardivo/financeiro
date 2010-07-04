# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_financeiro_session',
  :secret      => 'c3b8369b1b86b13eff2c55df4718e5712143dc8afba1223be8d860cd44b7cd8851ecd3b6264b84576b31bb7b3ac4dcde12b77df07dbaa98e40fca589f9fc752a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
