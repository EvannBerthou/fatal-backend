default_actions = %i[index show create update destroy]
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/users', to: 'user#home'
  get '/logged_in', to: 'user#logged_in?'

  resources :qcms, only: default_actions do
    get :generate, on: :member
  end
  resources :question, only: default_actions
  resources :reponse, only: default_actions
  resources :PDF, only: default_actions, controller: 'pdf' 
  resources :etudiant, only: default_actions
  resource :admin
end
