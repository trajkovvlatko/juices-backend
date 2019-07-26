Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3006'
    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head),
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client']
  end
end
