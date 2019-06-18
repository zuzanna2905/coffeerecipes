Rails.application.routes.draw do
  root 'home#index'
  resources :users, except: [:destroy]
  resources :recipes
  get 'table', to: 'recipes#table'
  get 'favorites', to: 'recipes#favorites'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end