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
end