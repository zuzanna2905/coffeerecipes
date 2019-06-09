Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :recipes
  resources :beans
  get 'roasters', to: 'roasters#index'
  get 'table', to: 'recipes#table'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
