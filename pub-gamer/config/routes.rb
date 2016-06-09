Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"

  root "welcome#index"
  get "register" => "users#new", as: "register"
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create", as: "new_login"
  delete "logout" => "sessions#destroy", as: "logout"

  resources :events do
    resources :comments, only: [:new, :create]
  end
  resources :venues
  resources :reviews 
  resources :users, only: [:show, :new, :create , :edit, :update]

end
