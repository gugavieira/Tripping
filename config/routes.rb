Tripping::Application.routes.draw do
    
  resources :photosets, :except => :edit do
    collection do
      post 'save_order'
    end
    member do
      get 'slideshow'
    end
  	# collection { post :save_order }
    # post "save_order", :on => :collection
  #   get "slideshow", :on => :member
  end

  namespace :admin do
    resources :posts, :except => :show
  end

  resources :posts, :only => [:index, :show, :feed]
  
  root :to => "pages#home"

  match "/admin/" => "admin#index", :as => :admin
  match "/friends/" => "photosets#friends"
  match "/blog/" => "posts#index"
  match "/about/" => "pages#about"

  match '/feed' => "posts#feed", :as => :feed, :defaults => { :format => 'atom' }


end