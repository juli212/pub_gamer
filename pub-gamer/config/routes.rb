Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"

# user authentication
  root "welcome#index"
  get "register" => "users#new", as: "register"
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create", as: "new_login"
  delete "logout" => "sessions#destroy", as: "logout"
# search
  post "search" => "venues#search", as: "search_venues"

  resources :events do
    resources :comments, only: [:create]
  end

  resources :venues do
    resources :reviews, only: [:create]
  end

  resources :users, only: [:show, :new, :create , :edit, :update]

end
