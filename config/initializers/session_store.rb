# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_promocast_session',
  :secret      => '5c661603fd060a8db7924d8075eb2e4b00cad59b7752df0343630ba2d3d4c9fe9f53b5463f2b5d5e86b84e77ed71eb07e0ba64212cf67dfe2c43d56d509c0d61'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
