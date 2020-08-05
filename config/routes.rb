Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'users#index'
  resources :users do
    collection do
      get :registration
      get :contents
      get :search
      get :mypage
    end
  end

  resources :lp do
    collection do
      get :top
    end
  end
  
  resources :creditcards, except: :show do
    collection do
      get 'buy'
    end
  end
  resources :receipts, only: :index

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

  resources :sns, except: :show
end
