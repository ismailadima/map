class PostsController < ApplicationController
	http_basic_authenticate_with name: "ismailadima", password: "secret",
	except: [:index, :show]
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
			redirect_to posts_path, notice: "Success"
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
  		redirect_to posts_path
	end
end
