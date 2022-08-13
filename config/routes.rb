default_actions = [:create, :show, :update, :destroy]
Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'user#home'
  get '/logged_in', to: 'user#logged_in?'

  resource :qcm, only: default_actions
  resource :question, only: default_actions
  resource :reponse, only: default_actions
  resource :etudiant, only: default_actions
  resource :admin
end
