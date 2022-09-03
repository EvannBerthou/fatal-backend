default_actions = %i[show create update destroy]
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/users', to: 'user#home'
  get '/logged_in', to: 'user#logged_in?'

  resources :qcm, only: default_actions do
    get :generate, on: :member
  end
  resources :question, only: default_actions
  resources :reponse, only: default_actions
  resources :etudiant, only: default_actions
  resource :admin
end
