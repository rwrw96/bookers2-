Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resources :books
  resources :users
  
  # post "/" => "books#create"
  # get "/" => "books#index"
  # post "books/index" => "books#new"
  # post "books/index" => "books#create"
  post "books/:id/edit" => "books#update"
  # get "books/index" => "books#index"
  # post "users/index" => "books#create"
  # post "users/:id/edit" => "users#update"
  # get "users/index" => "users#index"
  # get "users/index" => "users#show"
  # get "users/:id/show" => "users#show"
end
