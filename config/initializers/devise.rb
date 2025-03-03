# frozen_string_literal: true

Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # tokens, ensuring that signed data cannot be tampered with.
  config.secret_key = ENV['DEVISE_SECRET_KEY'] if Rails.env.production?

  # ==> Mailer Configuration
  config.mailer_sender = 'please-change-me@example.com'

  # Load and configure the ORM. Supports :active_record (default) and :mongoid
  require 'devise/orm/active_record'

  # ==> Authentication Configuration
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  
  config.skip_session_storage = [:http_auth]

  # ==> Navigation Configuration
  config.navigational_formats = ['*/*', :html, :json]

  # ==> Timeoutable Configuration
  config.expire_all_remember_me_on_sign_out = true

  # ==> Password Configuration
  config.stretches = Rails.env.test? ? 1 : 12
  
  config.send_password_change_notification = false

  # ==> Confirmable Configuration
  config.reconfirmable = true

  # ==> Lockable Configuration
  config.unlock_keys = [:email]
  config.unlock_strategy = :email
  config.maximum_attempts = 5
  config.unlock_in = 1.hour

  # ==> Token Configurations
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
