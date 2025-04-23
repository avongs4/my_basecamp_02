Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # ❗ Required for serving static files correctly on Render
  config.assets.compile = false
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Eager load code on boot for better performance and memory savings (ignored by Rake tasks).
  config.eager_load = true
end
