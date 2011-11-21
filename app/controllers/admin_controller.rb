class AdminController < ApplicationController

      
  def index
    @title = "Admin"
    @photosets = Photoset.all
    flickraw_response = flickr.photosets.getList(:user_id => '26368973@N00')
    @new_photosets = flickraw_response.to_a()
  end
end
