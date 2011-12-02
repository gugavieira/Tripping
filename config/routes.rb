Tripping::Application.routes.draw do
    
  resources :photosets do
  	collection { post :save_order }
  end
  
  root :to => "photosets#index"

  match "/admin/" => "admin#index", :as => :admin
  match "/friends/" => "photosets#friends"

  namespace :admin do
    resources :posts
  end

end