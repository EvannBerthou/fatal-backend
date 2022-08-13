Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'user#home'
end
