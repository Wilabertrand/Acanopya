Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :trips, only: [:new, :create, :show, :update, :index, :edit, :destroy] do
    resources :flats, only: [:index, :show]
    resources :restaurants, only: [:index, :show]
    resources :activities, only: [:index, :show]
  end

  resources :flats, only: [] do
    resources :flats_bookings, only: [:create]
  end
  resources :restaurants, only: [] do
    resources :restaurants_bookings, only: [:create]
  end
  resources :activities, only: [] do
    resources :activities_bookings, only: [:create]
  end



  resources :flats_bookings, only: [:show]
  resources :restaurants_bookings, only: [:show]
  resources :activities_bookings, only: [:show]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
