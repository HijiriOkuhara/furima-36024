Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:new, :create, :show]
  resources :orders, only:[:index, :create]
end
