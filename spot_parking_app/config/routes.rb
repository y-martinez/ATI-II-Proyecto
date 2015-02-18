Rails.application.routes.draw do

  root 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new'
  get 'sign_in' => 'users#new'
  get 'logout' => 'sessions#destroy'
  resources :users do
    get 'home' => 'users#index'
  end
end
