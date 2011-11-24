class ApplicationController < ActionController::Base
  include FlickrHelper
  protect_from_forgery
end
