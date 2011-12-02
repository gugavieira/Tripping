class PostsController < ApplicationController

	def index
    	@title = "Blog"
    	@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@title = @post.title
	end

	def feed
		# this will be the name of the feed displayed on the feed reader
		@title = "Tripping"

		# the news items
		@posts = Post.all

		# this will be our Feed's update timestamp
		@updated = @posts.first.updated_at unless @posts.empty?

		respond_to do |format|
			format.atom { render :layout => false }

			# we want the RSS feed to redirect permanently to the ATOM feed
			format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
		end
	end
end