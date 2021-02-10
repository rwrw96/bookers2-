Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resource :books
  
  post "/" => "books#create"
  get "/" => "books#index"
  get "/" => "users#index"
  # get "books/index" => "books#index"
end
