Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :likes, only: [:create]
      resources :comments, only: %i[new create destroy]
    end
  end
 
  # Defines API routes
  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, :skip => [:registrations, :passwords, :confirmations ]
      resources :posts, only: %i[index]
      resources :comments, only: %i[index create]
    end
  end
end
