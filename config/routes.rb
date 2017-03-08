Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"

# user authentication
  root "welcome#index"

  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create", as: "new_login"
  delete "logout" => "sessions#destroy", as: "logout"

  def reports
    # resources :report, only: [:create] do
      get "inaccuracy" => "report#new_inaccuracy", as: "report_inaccuracy"
      get "inquiry" => "report#new_inquiry", as: "report_inquiry"
    # end
  end
  resources :report, only: [:create]

  resources :users, except: [:index, :new] do
    reports
    get :events
    get :edit_password
    put :update_password
    put :update_favorite
  end
  get 'profile/:user_name', to: 'users#show', as: :user_profile

  resources :about, only: [:index]
  resources :contact, only: [:index] do 
  end

  resources :venues, except: [:destroy, :edit] do
    get :search, :on => :collection
    get :add_games, :on => :collection
    get :add_neighborhood, :on => :collection
    post :results, :on => :collection
    get :dropdown, :on => :collection
    resources :reviews, only: [:new, :create, :update, :show]
    resources :events, only: [:index]
  end

  post "/games/add_game" => "games#add_game", as: "add_game"

  resources :events, except: [:destroy] do
    get :search, :on => :collection
    get :add_venue, :on => :collection
    get :update_games, :on => :collection
    post :results, :on => :collection
    get :dropdown, :on => :collection
    put :guests
    post :cancel
    resources :comments, only: [:create]
  end

end
