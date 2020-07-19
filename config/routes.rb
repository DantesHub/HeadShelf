Rails.application.routes.draw do
  resources :titans
  resources :books

  root to: 'books#index'
end
