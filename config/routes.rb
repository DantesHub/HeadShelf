Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :titans do
    put :sort, on: :collection
  end
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
