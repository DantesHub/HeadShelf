Rails.application.routes.draw do
  resources :titans, except: [:show]
  get 'titan/:id', to: 'titans#show', as: 'titan_show'
  resources :titans
  resources :books

  root to: 'books#index'
end
