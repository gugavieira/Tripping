Tripping::Application.routes.draw do
    
  resources :photosets

  root :to => "photosets#index"

  match "/admin/" => "admin#index"


end