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
    thumbs = update_thumbs(params[:id])
    photos = update_photos(params[:id])
    if thumbs && photos
      flash[:success] = "Photos updated."
    end
    redirect_to admin_path
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

  private

  def update_thumbs(photoset_id)
    photoset = Photoset.find(photoset_id) 
    flickr_set = flickr_set(photoset.flickr_set_id)
    photoset.flickr_thumb_url = flickrurl_240(flickr_set.primary)
    photoset.save!
  end

  def update_photos(photoset_id)
    photoset = Photoset.find(photoset_id)
    flickr_photos = photos_flickr_params(photoset.flickr_set_id)

    flickr_photos.each_with_index do |flickr_photo, index| #updates and new photos
      flickr_photo[:position] = index
      photo = photoset.photo.find_by_flickr_photo_id(flickr_photo[:flickr_photo_id])
      if photo
        photo.update_attributes(flickr_photo)
      else
        photoset.photo.build(flickr_photo)
      end
    end

    if photoset.photo.count > flickr_photos.length #handle deletion
      photoset.photo.each do |photo|
        photo.destroy unless flickr_photos.any? {|p| p[:flickr_photo_id] == photo.flickr_photo_id}
      end
    end
    photoset.save!
  end
end