class AdminController < ApplicationController

  before_filter :flickr_authenticate
      
  def index
    @title = "Admin"
    @photosets = Photoset.all
    @new_photoset = Photoset.new
  end
end