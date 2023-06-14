Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/about', to: 'about#show'
  resources :users, only: %i[show update edit destroy]
  resources :accommodations do
    resources :exchanges, only: %i[create]
  end

  resources :exchanges, only: %i[index edit show] do
    resources :modalities, only: %i[create]
    resources :messages, only: %i[create]
  end

  resources :modalities, only: %i[update progress] do
    resources :reviews, only: %i[create update edit]
  end
end
