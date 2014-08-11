class SessionsController < ApplicationController
	def new
		
	end
	def create
		#1. GET USER BASED EMAIL
		#2. JIKA USER ADA OTENTIFIKASI DENGAN PASSWORD YANG DI SUBMIT
		#3. HANDLE RESPONS
		user = User.find_by(email: params[:email])
		respond_to do |format|
		if user && user.authenticate(params[:password])
			format.html do 
			#login success
			session[:user_id] = user.id
			redirect_to posts_path, notice: "Logged In!"
		end
		format.json {render json: user}
	else
		format.html do 
			flash.now.alert = "Invalid email or password"
			render :new
		end
		format.json {render json: "Invalid email or password"}
	end
end
end
def destroy
	session[:user_id] = nil
	redirect_to posts_path, notice: "Success Logged Out"
end
end
