# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*',
        headers: :any,
        methods: [:get, :post, :options, :put, :delete],
        credentials: false # Set to true if you need to include credentials
    end
  end
  