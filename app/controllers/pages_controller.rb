class PagesController < ApplicationController
  require 'open-uri'

  def home
    @title = "Home"
    @photosets = Photoset.all
    @post = recent_tumblr
  end

  def about
  	@title = "About Tripping"
    @photosets = Photoset.all
  end

  def image_proxy
    image_url = params[:url]
    image = open(image_url).read
    response.headers["Expires"] = CGI.rfc1123_date(Time.now + 1.day)
    send_data image, :filename => File.basename(image_url), :disposition => 'inline'
  end
end