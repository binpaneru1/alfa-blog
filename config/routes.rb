Rails.application.routes.draw do
  root 'pages#home'
  resources :articles
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, expect: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
