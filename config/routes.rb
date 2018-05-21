Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rockets do
    resources :flights
  end
end
