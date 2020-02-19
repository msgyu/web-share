Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :new, :create] do
    collection do
      get :registration
    end
  end
end
