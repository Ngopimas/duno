Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tracks, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :chapters, only: [:index, :show, :new, :create, :edit]
  end
  resources :subscriptions, only: [:create]
end
