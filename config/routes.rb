Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post "/users/login", to: "users#login"
  post "/users/signup", to: "users#signup"

  get "/students/stuff", to: "students#stuff"
end

# this really is the main branch

# now there is some new stuff on here
#  nah this is new

#hello 

# my name is angad