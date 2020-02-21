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
      get :search
    end
  end
  resources :creditcards, except: :show
  resources :products
end
