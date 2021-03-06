Rails.application.routes.draw do
  get '/newsletter', to: 'pages#newsletter'
  mount Ckeditor::Engine => '/ckeditor' #, sign_up: '22/register' 
  devise_for :users, path: '', path_names: { sign_in: '32/login', sign_out: 'logout'}
#32login
  resources :titans do
    put :sort, on: :collection
  end
  resources :articles do
    member do
      get :toggle_status
    end
  end
  resources :books do
    member do
      get :toggle_status
    end
  end
  root to: 'articles#index'
  devise_scope :user do
    get '55/logout', to: 'devise/sessions#destroy'
  end
end
