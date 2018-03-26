Rails.application.routes.draw do
  devise_for :users

  scope "(:locale)", :locale => /en|vn/ do
    root "products#index"
    get "products/index"
  end
  resources :products

  mount RailsAdmin::Engine => '/foxzi', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
