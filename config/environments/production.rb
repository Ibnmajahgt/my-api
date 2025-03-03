require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance and memory savings.
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Cache assets for far-future expiry since they are all digest stamped.
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.year.to_i}" }

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Assume all access to the app is happening through an SSL-terminating reverse proxy.
  config.assume_ssl = true

  # Force all access to the app over SSL and use secure cookies.
  config.force_ssl = true

  # Skip http-to-https redirect for the default health check endpoint.
  # config.ssl_options = { redirect: { exclude: ->(request) { request.path == "/up" } } }

  # Logging configuration
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.logger.formatter = Logger::Formatter.new

  # Set log level (defaults to "info" if not set in ENV)
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info").to_sym

  # Prevent health checks from clogging up the logs.
  config.silence_healthcheck_path = "/up"

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Configure Redis as the cache store.
  config.cache_store = :redis_cache_store, { url: ENV.fetch("REDIS_URL", "redis://localhost:6379/1") }

  # Configure Active Job queue adapter.
  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = { database: { writing: :queue } }

  # Ignore bad email addresses and do not raise email delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Set host for mailer templates.
  config.action_mailer.default_url_options = { host: ENV.fetch("APP_HOST", "example.com") }

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Optimize Active Record logging.
  config.active_record.attributes_for_inspect = [:id]

  # Enable DNS rebinding protection.
  # config.hosts = ["example.com", /.*\.example\.com/]

  # Skip DNS rebinding protection for the health check endpoint.
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
