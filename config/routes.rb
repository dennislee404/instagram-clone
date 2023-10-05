Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  resources :posts do
    resources :comments
  end

  post "/users/:id/follow", to: "user#follow", as: "follow_user", method: "post"
end
