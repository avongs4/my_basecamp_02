require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests
  config.enable_reloading = false

  # Eager load code on boot for performance in production-like environments
  config.eager_load = true

  # Show full error reports — TEMP: Turn this off in production
  config.consider_all_requests_local = false


  # Asset pipeline config
  config.assets.compile = false
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{1.year.to_i}"
  }

# Caching (Redis)
config.action_controller.perform_caching = true
config.cache_store = :redis_cache_store, {
  url: ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" },
  error_handler: -> (method:, returning:, exception:) {
    Rails.logger.error "Redis cache error: #{exception}"
  }
}

# Show full error reports (set to false in production)
config.consider_all_requests_local = false



  # Active Storage
  config.active_storage.service = :local # TEMP: change to :amazon for production

  # SSL and security
  config.assume_ssl = true
  config.force_ssl = true

  # Logging
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new($stdout))
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.silence_healthcheck_path = "/up"

  # Deprecation warnings
  config.active_support.report_deprecations = false

  config.i18n.fallbacks = true

  # Schema dump
  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [:id]

  # Mailer
  config.action_mailer.default_url_options = { host: "example.com" }

end
