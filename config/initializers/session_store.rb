# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vsftpd-users_session',
  :secret      => 'bf6d967ea77cde30177e20a76d9fe9c2318827b8918fb8fcc7c299f283482e0523f9487115bdfdfa4dde6b08b379373d7571671b2dd473d023ffe9b02260d185'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
