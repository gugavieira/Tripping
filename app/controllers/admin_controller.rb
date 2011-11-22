class AdminController < ApplicationController
      
  def index
    @title = "Admin"
    @photosets = Photoset.all
    @new_photoset = Photoset.new
  end
end