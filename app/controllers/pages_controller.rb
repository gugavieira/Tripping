class PagesController < ApplicationController

  def index
    @title = "Home"
    @photosets = Photoset.all
    @post = Post.first
  end

  def posts
    @title = "Blog"
    @posts = Post.all
  end
end
