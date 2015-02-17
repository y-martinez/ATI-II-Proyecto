Rails.application.routes.draw do

  root 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :users
  get 'sign_in' => 'users#new'  
  get 'home' => 'users#index'

end
