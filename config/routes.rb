Rails.application.routes.draw do
  resources :titans
  resources :books do
    member do
      get :toggle_status
    end
  end
  root to: 'books#index'
end
