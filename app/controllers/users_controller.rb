class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
		if @user.save
			redirect_to new_user_path
		else
			render :new
		end

	end
end
