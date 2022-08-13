Rails.application.routes.draw do
  get '/users', to: 'user#home'
end
