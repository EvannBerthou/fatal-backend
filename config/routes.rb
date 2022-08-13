Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'user#home'
  get '/logged_in', to: 'user#logged_in?'
end
