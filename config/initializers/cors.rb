Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:4200'
    resource '*', headers: :any, methods: :any, credentials: true, expose: ['Authorization']
  end
end