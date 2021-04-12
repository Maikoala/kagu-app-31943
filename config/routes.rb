Rails.application.routes.draw do
  get 'users/show'
  get 'owners/show'
  get 'items/index'
  get 'shops/index'
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "shops#index"

  resources :shops, only: [:index, :new, :create] do
    resources :items
  end

  resources :items do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :create]
  end

  resources :owners, only: [:show]
  resources :users, only: [:show]
end
