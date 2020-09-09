Rails.application.routes.draw do
  devise_for :administrators
  devise_for :customers
  devise_for :owners

  # For Owners, some REST actions exept show are handle by devise :
  resources :owners, only: [:show]

  resources :businesses do
    resources :items
  end

  # Root is Hello, world
  root 'static_pages#home'

  get '/crystal', to: 'static_pages#crystal_template'
  get '/kit_ui', to: 'static_pages#kit_ui'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
