Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      namespace :rawg do
        get "/creators", to: "rawg#get_creators"
      end
      namespace :nasa do
        get "search", to: "nasa#search"
        get "horizons", to: "nasa#horizons"
      end
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
  match "*path", to: "application#route_not_found", via: :all
end
