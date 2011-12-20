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

  def slideshow
    @photoset = Photoset.find(params[:id])
    @title = "Slideshow: " + @photoset.name
    if session[:friends]
      @photos = Photoset.find(params[:id]).photo.all
    else
      @photos = Photoset.find(params[:id]).photo.only_public.all
    end
  end

  def friends
    session[:friends] = true
    redirect_to root_path
  end
end