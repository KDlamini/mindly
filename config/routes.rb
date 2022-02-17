Rails.application.routes.draw do
  get "/users/:user_id/posts", to: "posts#index"
  get "/users/:user_id/posts/:id", to: "posts#show"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end