class PhotosetsController < ApplicationController
  def index
  end

  def create
    params[:photoset][:id] = params[:photoset][:id].to_i
    @new_photoset = Photoset.new(params[:photoset])
    @new_photoset.save!
    redirect_to admin_path
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
