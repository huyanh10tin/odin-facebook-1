Rails.application.routes.draw do
  devise_for :users

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :users, only: :show

  root 'static_pages#home'
end
