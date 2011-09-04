# Be sure to restart your server when you modify this file.

if Rails.env == 'production'
  require 'action_dispatch/middleware/session/dalli_store'
  Whiteboard::Application.config.session_store :dalli_store, :key => '_whiteboard_session'
else
  Whiteboard::Application.config.session_store :mem_cache_store, :key => '_whiteboard_session'
end

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Whiteboard::Application.config.session_store :active_record_store
