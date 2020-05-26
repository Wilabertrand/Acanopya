Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :flats, only: [:index, :show]
  resources :restaurants, only: [:index, :show]
  resources :activities, only: [:index, :show]

end
