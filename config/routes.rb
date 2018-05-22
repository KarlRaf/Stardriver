Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rockets do
    resources :flights
  end

  resources :bookings, only: [:index, :show, :new, :create]

end
