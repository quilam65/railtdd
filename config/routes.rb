Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/foxzi', as: 'rails_admin'
  resources :products
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
