# Only use workers in non-Windows environments
workers Integer(ENV['WEB_CONCURRENCY'] || 2) unless Gem.win_platform?

threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      'config.ru'
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "production" }

on_worker_boot do
  
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
  sleep 1
end