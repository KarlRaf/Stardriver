Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show
  resources :flights
  resources :rockets do
    resources :flights
  end
end
