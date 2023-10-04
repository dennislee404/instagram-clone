class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = current_user.comments.create(comment_params.merge(post_id: @post.id))

		if @comment.save
			redirect_to post_path(@post)
		else
			redirect_to root_path
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:content)
		end
end
