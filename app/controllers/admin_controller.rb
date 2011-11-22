class AdminController < ApplicationController
      
  def index
    @title = "Admin"
    @photosets = Photoset.all
    @new_photoset = Photoset.new
    @not_imported_sets = not_imported_sets
  end

  
  private

  def not_imported_sets
  	flickr_sets.reject{|element| Photoset.exists?(:flickr_set_id => element['id'])}
  end

  def flickr_sets
  	flickraw_response = flickr.photosets.getList(:user_id => '26368973@N00')
	  flickraw_response.to_a()
  end
end