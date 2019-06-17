Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes, except: [:index]
  resources :beans
  get 'roasters', to: 'roasters#index'
  get 'table', to: 'recipes#table'
  get 'favorites', to: 'recipes#favorites'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
