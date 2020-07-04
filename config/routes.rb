Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tracks
  resources :subscriptions, only: [:create]
end
