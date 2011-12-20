class AdminController < ApplicationController

  before_filter :flickr_authenticate, :only => :index
      
  def index
    @title = "Admin"
    @photosets = Photoset.all
    @new_photoset = Photoset.new
    @not_imported_sets = not_imported_sets # From FlickrHelper
  end
end