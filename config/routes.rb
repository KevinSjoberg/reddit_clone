RedditClone::Application.routes.draw do
  get  "/login"    => "sessions#new", :as => :login
  post "/sessions" => "sessions#create"
  root to: "dashboard#index"
end
