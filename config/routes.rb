Tripping::Application.routes.draw do
    
  resources :photosets do
  	collection { post :save_order }
  end
  
  root :to => "pages#index"

  match "/admin/" => "admin#index", :as => :admin
  match "/friends/" => "photosets#friends"
  match "/blog/" => "pages#posts"


  namespace :admin do
    resources :posts
  end

  match '/feed' => "posts#feed", :as => :feed, :defaults => { :format => 'atom' }


end