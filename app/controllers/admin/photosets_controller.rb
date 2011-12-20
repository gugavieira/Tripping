class Admin::PhotosetsController < ApplicationController

before_filter :flickr_authenticate, :only => [:create, :update]

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
    @photoset = Photoset.find(params[:id])
    thumbs = update_thumbs(@photoset)
    photos = update_photos(@photoset)
    if thumbs && photos
      flash[:success] = "Photoset " + @photoset.name + " updated."
    end
    redirect_to admin_path
  end

  def save_order
    params[:set].each_with_index do |id, index|
      Photoset.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  private

  def update_thumbs(photoset) 
    flickr_set = flickr_set(photoset.flickr_set_id)
    photoset.flickr_thumb_url = flickrurl_240(flickr_set.primary)
    photoset.save!
  end

  def update_photos(photoset)
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