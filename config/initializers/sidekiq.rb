ENV["REDIS_PROVIDER"] ||= "redis://localhost:6379"

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDIS_PROVIDER"] }
end