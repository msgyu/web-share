Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users do
    collection do
      get :registration
      get :contents
      get :search
    end
  end
  resources :products
end
