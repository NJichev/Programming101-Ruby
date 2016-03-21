Rails.application.routes.draw do
  resources :brands
  get 'brands/range/:id', to: "brands#count"
  get 'brands/range/:id/:range', to: "brands#range"

  resources :categories
  get 'categories/range/:id', to: "categories#range"
  get 'categories/range/:id/:range', to: "categories#index"

  resources :products
  get 'products/range/:id', to: "products#range"
  get 'products/range/:id/:range', to: "products#index"

  resources :users, only: [:index, :new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
