class UsersController < ApplicationController
	before_action :set_user
	
	def show
	end

	def follow
	end

	def unfollow
	end

	private
		def set_user
			@user = User.find(params[:id])
		end
end