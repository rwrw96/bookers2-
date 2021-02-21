Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  root to: "homes#top"
  
  # post "users" => "books#create"
  post "users/:id/edit" => "users#update"
  post "books/:id/edit" => "books#update"
  # get "/" => "books#show"
  # post "/" => "books#create"
  # get "homes/top" => "homes#top"
  # post "/" => "books#create"
  # get "/" => "books#index"
  # post "books/index" => "books#new"
  # post "books/index" => "books#create"
  # post "books/:id/edit" => "books#update"
  # post "books/:id" => "books#create"
  # post "books/:id/edit" => "books#show"
  # get "books/index" => "books#index"
  # post "users/index" => "books#create"
  # get "users/index" => "users#index"
  # get "users/index" => "users#show"
  # get "users/:id/show" => "users#show"
end
