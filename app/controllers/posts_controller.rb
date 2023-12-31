class PostsController < ApplicationController
	before_action :set_post, only: [:update, :edit, :show, :destroy, :like]
	
	def index
		@posts = current_user.posts.all.order(created_at: :asc)
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def show
		@comment = Comment.new
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def destroy
		@post.destroy

		redirect_to root_path
	end

	def like
		current_user.likes.create(likeable: @post)
		redirect_back(fallback_location: root_path)
	end

	private
		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:caption, photos: [])
		end
end
