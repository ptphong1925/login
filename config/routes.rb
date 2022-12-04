Rails.application.routes.draw do
  get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  delete 'login', to: 'login#destroy'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
