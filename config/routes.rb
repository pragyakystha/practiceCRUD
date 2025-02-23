Rails.application.routes.draw do
  resources :users, only: [ :new, :create ]
  resources :products
  resources :bands
  resources :authors
  resources :books
  namespace :api do
  namespace :v1 do
  resources :articles
  resources :posts do
  resources :comments, only: [ :create ]
    end
  end
  end
  resources :posts, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

get "home/about", to: "home#about"
root "home#index"
get "home/products", to: "products#index"
get "home/bands", to: "bands#index"
get "home/articles", to: "articles#index"
get "home/authors", to: "authors#index"
get "login", to: "sessions#new"
post "login", to: "sessions#create"
get "register", to: "users#new"
post "register", to: "users#create"
delete "/posts/:id", to: "posts#destroy", as: "delete_post"


get "/users", to: redirect("/register")











  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "rails/health#show"
end
