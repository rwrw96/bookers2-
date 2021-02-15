Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resources :books
  resources :users, only: [:edit]
  
  
  post "/" => "books#create"
  get "/" => "books#index"
  post "/" => "books#new"
  post "/" => "books#create"
  get "books/index" => "books#index"
  post "users/:id/edit" => "users#update"
end
