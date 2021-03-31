Rails.application.routes.draw do
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
    resources :items, only: [:index, :new, :create]
  end
end
