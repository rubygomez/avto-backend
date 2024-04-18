Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # sign up
  post "/users" => "users#create"
  get "/users" => "users#index"
  # log in
  post "/sessions" => "sessions#create"
  # viewers can see all and one car
  get "/cars" => "cars#index"
  get "/cars/:id" => "cars#show"
  

end
