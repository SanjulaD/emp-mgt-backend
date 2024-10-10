# frozen_string_literal: true

class Rack::Attack
    # Allow all requests from localhost
    safelist('allow localhost') do |req|
      req.ip == '127.0.0.1'
    end
  
    # Throttle requests to 5 requests per second per IP address
    throttle('req/ip', limit: 5, period: 1.second) do |req|
      req.ip
    end
  end
  