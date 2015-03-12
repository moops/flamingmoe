Rails.application.routes.draw do
  resources :products
  resources :orders

  root to: 'orders#index'
end
