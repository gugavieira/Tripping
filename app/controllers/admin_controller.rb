class AdminController < ApplicationController

      
  def index
    @title = "Admin"
    @photosets = Photoset.all
  end
end
