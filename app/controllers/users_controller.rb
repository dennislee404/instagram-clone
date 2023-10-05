class UsersController < ApplicationController
	before_action :set_user
	
	def show
	end

	def follow
		current_user.following_users.create(followee_id: @user.id)
		redirect_back(fallback_location: root_path)
	end

	def unfollow
		current_user.following_users.find_by(followee_id: @user.id).destroy
		redirect_back(fallback_location: root_path)
	end

	private
		def set_user
			@user = User.find(params[:id])
		end
end