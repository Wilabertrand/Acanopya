Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :trips, only: [:new, :create, :show, :update, :index, :edit, :destroy]
  resources :restaurants, only: [:index, :show]
  resources :activities, only: [:index, :show]
  resources :flats, only: [:index, :show]

  resources :flats do
    resources :flats_bookings, only: [:create]
  end
  /resources :restaurants do
    resources :restaurants_bookings, only: [:create]
  end
  resources :activities do
    resources :activities_bookings, only: [:create]
  end/

  resources :flats_bookings, only: [:show]
  /resources :restaurants_bookings, only: [:show]
  resources :activities_bookings, only: [:show]/
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
