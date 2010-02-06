# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_elmd_session',
  :secret      => 'dc18fced4c95c1d5959717aa62444afa2a9eb8e022c8909e5b911e663fd40a92547fc160c50c530d5bf43219b93a8a1b61b36654c44008390685e89aaa28ea0c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
