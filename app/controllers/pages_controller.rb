class PagesController < ApplicationController

  def home
    @title = "Home"
    @photosets = Photoset.all
    @post = Post.first
  end

  def about
  	@title = "About Tripping"
    @photosets = Photoset.all
  end

end
