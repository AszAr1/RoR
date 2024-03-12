Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :categories
  resource :registration
  resource :session

  get "/me", to: "main#me"
  get "/events/:id/delete_confirmation", to: "events#delete_confirmation"
  get "/categories/:id/delete_confirmation", to: "categories#delete_confirmation"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app ips live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "main#index"

end
