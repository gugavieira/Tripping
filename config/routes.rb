Tripping::Application.routes.draw do
    
  resources :photosets do
  	collection { post :save_order }
  end

  root :to => "photosets#index"

  match "/admin/" => "admin#index"
  match "/friends/" => "photosets#friends"

end