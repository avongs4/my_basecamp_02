require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests
  config.enable_reloading = false

  # Eager load code on boot for performance in production-like environments
  config.eager_load = true

  # Show full error reports — TEMP: Turn this off in production
  config.consider_all_requests_local = true

  # Asset pipeline config
  config.assets.compile = false
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{1.year.to_i}"
  }

  # Caching
  config.action_controller.perform_caching = true
  config.cache_store = :solid_cache_store

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

  # Active Job
  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = { database: { writing: :queue } }

  # Internationalization
  config.i18n.fallbacks = true

  # Schema dump
  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [:id]

  # Mailer
  config.action_mailer.default_url_options = { host: "example.com" }

  # Uncomment and configure if sending emails
  # config.action_mailer.raise_delivery_errors = false
  # config.action_mailer.smtp_settings = {
  #   user_name: Rails.application.credentials.dig(:smtp, :user_name),
  #   password: Rails.application.credentials.dig(:smtp, :password),
  #   address: "smtp.example.com",
  #   port: 587,
  #   authentication: :plain
  # }

  # Uncomment to restrict allowed hosts (e.g., on Render or Heroku)
  # config.hosts << "your-app.onrender.com"

  # Optional: Allow requests to the healthcheck path without host validation
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
