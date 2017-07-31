Rails.application.routes.draw do
  devise_for :users

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :users, only: %i[show index] do
    get '/friend_requests', to: 'friend_requests#index'
    get '/friends', to: 'friendships#index'
  end

  resources :friend_requests, only: %i[create update destroy]
  resources :friendships, only: :destroy

  root 'static_pages#home'
end
