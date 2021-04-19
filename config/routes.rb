Rails.application.routes.draw do
  root 'home#index'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, expect: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
