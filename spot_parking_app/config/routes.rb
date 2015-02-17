Rails.application.routes.draw do

  root 'home#index'
  get 'login' => 'sessions#new'
  get 'sign_in' => 'users#new'

  resources :sessions do  
    get 'logout' => 'sessions#destroy', on: :collection
  end
  resources :users  do  
    get 'home' => 'users#index',on: :collection
    
  end
end
