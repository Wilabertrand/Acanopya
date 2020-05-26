Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :trips, only: [:new, :create, :show, :update]
  resources :restaurants, only: [:index, :show]
  resources :activities, only: [:index, :show]
  resources :flats, only: [:index, :show]

end
