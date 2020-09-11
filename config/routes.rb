# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :administrators
    resources :customers
    resources :owners
    resources :businesses
    resources :business_follows
    resources :happy_codes
    resources :happy_prices
    resources :items

    root to: 'administrators#index'
  end
  devise_for :administrators
  devise_for :customers
  devise_for :owners

  # For Owners, some REST actions exept show are handle by devise :
  resources :owners, only: [:show]
  resources :customers, only: [:show]
  resources :business_follows, only: %i[create destroy]

  resources :businesses do
    resources :items do
      resources :happy_prices, only: %i[new create edit update destroy] do
        resources :happy_codes, only: %i[create]
      end
      resources :item_photos, only: [:create]
    end
    resources :business_photos, only: [:create]
  end

  # Root is index of all businesses
  root 'businesses#index'

  get '/crystal', to: 'static_pages#crystal_template'
  get '/kit_ui', to: 'static_pages#kit_ui'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
