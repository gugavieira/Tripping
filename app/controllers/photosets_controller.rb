class PhotosetsController < ApplicationController

  def index
  end

  def create
    new_photoset = Photoset.new(params[:photoset])
    new_photoset.photo.build(photos_flickr_params(params[:photoset][:flickr_set_id]))
    if new_photoset.save!
      flash[:Success] = 'Photoset imported.'
      redirect_to admin_path
    else
      flash[:error] = 'Something went wrong.'
      redirect_to admin_path
    end


  end
  
  def edit
  end
  
  def destroy
    photoset = Photoset.find(params[:id])
    photoset.destroy
    flash[:success] = "Photoset deleted."
  	redirect_to admin_path
  end

  def update
  	redirect_to admin_path
  end

end
