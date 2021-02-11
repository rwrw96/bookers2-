Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resource :books
  
  post "/" => "books#create"
  get "/" => "books#index"
  get "/" => "users#index"
  get "users/edit" => "users#edit"
  patch "users/edit" => "users/edit"
  post "/" => "books#new"
  post "/" => "books#create"
  get "books/index" => "books#index"
end
