Rails.application.routes.draw do
  get 'creditcards/index'
  get 'creditcards/new'
  get 'creditcards/create'
  get 'creditcards/destroy'
  devise_for :users
  root 'users#index'
  resources :users do
    collection do
      get :registration
      get :contents
    end
  end
  resources :products
end
