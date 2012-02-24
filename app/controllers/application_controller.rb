class ApplicationController < ActionController::Base
  include FlickrHelper
  include TumblrHelper
  protect_from_forgery
end
