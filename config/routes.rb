Rails.application.routes.draw do
  resources :hashtags
  resources :violations
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
  root "home#index"
  resources :friends
  resources :follows
  resources :subcomments
  resources :articles
  resources :songs
  resources :posts
  resources :likes
  resources :rates
  resources :nations
  resources :videos
  resources :musics
  resources :comments
  resources :catalogues
  resources :admins
  resources :authors
  resources :books
  resources :suppliers
  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  delete 'signout', to: 'session#destroy'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
