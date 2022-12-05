Rails.application.routes.draw do
  get 'session/new'
  resources :books
  resources :suppliers
  get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  delete 'login', to: 'login#destroy'
  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  delete 'signout', to: 'session#destroy'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
