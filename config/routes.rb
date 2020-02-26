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
      get :mypage
    end
  end
  resources :creditcards, except: :show
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
