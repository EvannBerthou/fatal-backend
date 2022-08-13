default_actions = %i[show create update destroy]
Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'user#home'
  get '/logged_in', to: 'user#logged_in?'

  resources :qcm, only: default_actions
  resources :question, only: default_actions
  resources :reponse, only: default_actions
  resources :etudiant, only: default_actions
  resource :admin
end
