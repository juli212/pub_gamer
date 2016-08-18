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
  post "search_venues" => "venues#search_venues"
  post "search_events" => "events#search_events"
  # get "venues_search" => 'venues#search'

  resources :events do
    resources :comments, only: [:create]
  end

  resources :venues do
    get :search, :on => :collection
    resources :reviews, only: [:create]
  end

  # resources :venues do
  # end

  resources :users, only: [:show, :new, :create , :edit, :update]

end
