class PagesController < ApplicationController

  def home
    @title = "Home"
    @photosets = Photoset.all
    @post = Post.first
  end


end
