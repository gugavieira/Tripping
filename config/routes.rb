Tripping::Application.routes.draw do
    
  resources :photosets, :only => [:index, :show] do
    member do
      get 'slideshow'
    end
  end

  namespace :admin do
    resources :posts, :except => :show
    resources :photosets, :only => [:create, :destroy, :update] do
      collection do
        post 'save_order'
      end
    end
  end

  resources :posts, :only => [:index, :show, :feed]
  
  root :to => "pages#home"

  match "/admin/" => "admin#index", :as => :admin
  match "/friends/" => "photosets#friends"
  match "/blog/" => "posts#index"
  match "/about/" => "pages#about"
  match "/proxy/" => "pages#image_proxy"

  match '/feed' => "posts#feed", :as => :feed, :defaults => { :format => 'atom' }
end