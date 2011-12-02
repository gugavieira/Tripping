Tripping::Application.routes.draw do
    
  resources :photosets do
  	collection { post :save_order }
  end

  namespace :admin do
    resources :posts, :except => :show
  end

  resources :posts, :only => [:index, :show, :feed]
  
  root :to => "pages#home"

  match "/admin/" => "admin#index", :as => :admin
  match "/friends/" => "photosets#friends"
  match "/blog/" => "posts#index"

  match '/feed' => "posts#feed", :as => :feed, :defaults => { :format => 'atom' }


end