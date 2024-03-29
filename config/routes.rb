Rails.application.routes.draw do
  resources :catalogues
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
  resources :likes
  resources :rates
  resources :nations
  resources :videos
  resources :comments
  resources :admins
  resources :authors
  resources :books
  resources :suppliers
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :users do
    member do
      put 'last_seen_at'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api do
    namespace :v1 do
      post 'signin', to: 'session#create'
      resources :users, only: [:index, :show, :create, :update]
      resources :comments
    end
  end

end
