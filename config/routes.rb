Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end

  resources :posts, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
          resources :likes
        end
      end
    end
  end
end
