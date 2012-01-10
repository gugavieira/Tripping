class AdminController < ApplicationController

  http_basic_authenticate_with :name => Tripping::Application.config.admin_username,
  							   :password => Tripping::Application.config.admin_password

  before_filter :flickr_authenticate, :only => :index
       
  def index
    @title = "Admin"
    @photosets = Photoset.all
    @new_photoset = Photoset.new
    @not_imported_sets = not_imported_sets # From FlickrHelper
  end
end
