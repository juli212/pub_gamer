Rails.application.routes.draw do

  root "welcome#index"

  get "register" => "users#new", as: "register"
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create", as: "new_login"

end
