require_relative "boot"

require "rails/all"  # Make sure this is present

Bundler.require(*Rails.groups)

module MyApi
  class Application < Rails::Application
    config.load_defaults 8.0

    config.api_only = true

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
  end
end
