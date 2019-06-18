Rails.application.routes.draw do
  root 'home#index'
  resources :users, except: [:destroy]
  resources :recipes
  resources :beans
  resources :roasters
  get 'table', to: 'recipes#table'
  get 'favorites', to: 'recipes#favorites'
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end