Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    member do
      get :toggle_status
    end
  end
  resources :titans
  resources :books do
    member do
      get :toggle_status
    end
  end
  root to: 'books#index'
end
