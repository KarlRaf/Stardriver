Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show
  resources :flights
  resources :rockets do
    resources :flights
  end
  resources :flights do
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
  end

  resources :bookings, only: [:index, :show]
end
