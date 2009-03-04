# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_railersbr_session',
  :secret      => '05842b3739c5f391e50f93af3d758d775c462699cb0b2e81b64eed1067cc61b8ebce59277650fdfa8738b00205346ef16c5d655d8d9976e3b054d8d8d71bf42d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
