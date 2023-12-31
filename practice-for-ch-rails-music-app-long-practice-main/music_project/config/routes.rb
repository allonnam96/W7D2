Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show, :new, :create]
  resource :session, only: [:new, :create, :destroy]
end
