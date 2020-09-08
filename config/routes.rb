Rails.application.routes.draw do
  devise_for :administrators
  devise_for :customers
  devise_for :owners
  # Root is Hello, world
  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
