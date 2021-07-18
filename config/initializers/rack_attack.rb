Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

Rack::Attack.throttle('web/ip', limit: 300, period: 5.minutes) do |request|
  request.ip
end

Rack::Attack.throttle('login/ip', limit: 5, period: 5.minutes) do |request|
  request.post? and request.path.eql?('/sessions') and request.ip
end
