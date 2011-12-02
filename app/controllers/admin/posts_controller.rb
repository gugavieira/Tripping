class Admin::PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@photosets = Photoset.all
	end

	def create
		@post = Post.new(params[:post])
	    if @post.save
	      redirect_to admin_posts_path, :flash => { :success => "Posted." }
	    else
		  redirect_to new_admin_post_path
	    end
	end

	def edit
		@title = "Edit post"
		@post = Post.find(params[:id])

	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
	    	redirect_to admin_posts_path, :flash => { :success => "Post updated." }
	    else
	      @title = "Edit post"
	      render 'edit'
	    end
	end

	def destroy
		post = Post.find(params[:id])
	    if post.destroy
	      flash[:success] = "Post deleted."
	    else
	      flash[:error] = "I couldn't delete the post. Don't know why."
	    end
	  	redirect_to admin_posts_path
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