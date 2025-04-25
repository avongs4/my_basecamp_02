require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mybasecamp2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Set Active Job queue adapter
    config.active_job.queue_adapter = :async
    config.api_only = false


    # Autoload and eager load paths
    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)

    # If you want to ignore some lib subfolders like assets or tasks:
    # Just ensure they don't have .rb files or won't be accidentally loaded.
    # You do not need to use `config.autoload_lib` – that's not a valid Rails method.
    # Instead, just avoid adding those directories to autoload paths.

    # Custom configuration
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
