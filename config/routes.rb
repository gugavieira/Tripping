Tripping::Application.routes.draw do
    
  root :to => "pages#index"

  resources :photosets do
  	collection { post :save_order }
  end

  resources :posts

  match "/admin/" => "admin#index", :as => :admin
  match "/friends/" => "photosets#friends"
  match "/blog/" => "pages#posts"
  
  match '/feed' => "posts#feed", :as => :feed, :defaults => { :format => 'atom' }


end