Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"

# user authentication
  root "welcome#index"

  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create", as: "new_login"
  delete "logout" => "sessions#destroy", as: "logout"

  resources :events, except: [:destroy] do
    get :search, :on => :collection
    get :add_venue, :on => :collection
    get :update_games, :on => :collection
    put :guests
    post :cancel
    resources :comments, only: [:create]
  end

  resources :venues, except: [:destroy] do
    get :search, :on => :collection
    get :add_games, :on => :collection
    get :add_neighborhood, :on => :collection
    post :results, :on => :collection
    # get :inaccurate
    get :dropdown, :on => :collection
    get :map, on: :collection
    resources :reviews, only: [:new, :create, :update, :show]
    resources :events, only: [:index]
  end

  resources :users, except: [:index, :new, :destroy] do
    get :events
    put :delete_profile
    get :edit_password
    put :update_password
    put :update_favorite
  end
  # resources :games, only: [:create]

  # get :ga
  post "/games/add_game" => "games#add_game", as: "add_game"

  resources :about, only: [:index]
  resources :contact, only: [:index]

end
