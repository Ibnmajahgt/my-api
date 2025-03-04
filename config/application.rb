module MyApi
  class Application < Rails::Application
    config.load_defaults 8.0

    # Ensure API-only mode (skips assets, helpers, etc.)
    config.api_only = true

    # Include middleware for authentication if using Devise
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
  end
end
