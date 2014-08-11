class PostsController < ApplicationController
	before_action :authorize, except: [:index, :show]
	def index
		@post = Post.all
		respond_to do |format|
			format.html
			format.json {render json: @post}
		end
	end
	def new 
		@post = Post.new		
	end
	def create
		@post = Post.new(params.require(:post).permit(:name, :latitude, :longitude))
		if @post.save
			redirect_to root_path, notice: "Success"
		else
			render :new
		end
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		@post.update(params.require(:post).permit(:name, :longitude, :latitude))
		redirect_to posts_path
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
  		respond_to do |format|
  			format.html { redirect_to root_path, notice: 'Model was successfully destroyed' }
  			format.json { head :no_content }
  		end
	end
	def show
		@post = Post.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render json: @post}
		end
	end
end
