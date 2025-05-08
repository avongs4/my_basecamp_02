SolidQueue.configure do |config|
    config.queue_adapter_config = {
      url: Rails.configuration.database_configuration[Rails.env]["url"],
    }
  end