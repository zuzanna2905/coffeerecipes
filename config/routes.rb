Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, except: [:destroy]
  resources :recipes do 
    resources :comments
  end
  resources :beans
  resources :roasters
  get 'table', to: 'recipes#table'
  post 'add_favorite', to: 'favorites#create'
  delete 'remove_favorite', to: 'favorites#destroy'
  get 'favorites', to: 'favorites#index'
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  # get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
  # get ‘auth/failure’, to: redirect(‘/’)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end