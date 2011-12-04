class PhotosetsController < ApplicationController

  def index
    redirect_to root_path
  end

  def show
    @title = Photoset.find(params[:id]).name
    if session[:friends]
      @photos = Photoset.find(params[:id]).photo.paginate(:page => params[:page], :per_page => 20)
    else
      @photos = Photoset.find(params[:id]).photo.only_public.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def create
    new_photoset = Photoset.new(params[:photoset])
    flickr_photos = photos_flickr_params(params[:photoset][:flickr_set_id])
    new_photoset.photo.build(flickr_photos)
    if new_photoset.save!
      Photoset.refresh_order
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
    if photoset.destroy
      Photoset.refresh_order
      flash[:success] = "Photoset deleted."
    else
      flash[:error] = "I couldn't delete the photoset. Don't know why."
    end
  	redirect_to admin_path
  end

  def update
    photoset = Photoset.find(params[:id]) 
    flickr_set = flickr_set(photoset.flickr_set_id)
    photoset.flickr_thumb_url = flickrurl_240(flickr_set.primary)
    if photoset.save!
      flash[:Success] = 'Photoset ' + photoset.name + ' updated.'
      redirect_to admin_path
    end
  end

  def save_order
    params[:set].each_with_index do |id, index|
      Photoset.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  def friends
    session[:friends] = true
    redirect_to root_path
  end
end
