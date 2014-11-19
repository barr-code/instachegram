class CommentsController < ApplicationController

	def index
	end

	def new
	  @photo = Photo.find(params[:photo_id])
	  @comment = Comment.new
	end

	def create
	  @photo = Photo.find(params[:photo_id])
	  @comment = @photo.comments.new(comment_params)
	  if current_user
	  	@comment.user_id = current_user.id
	  	@comment.save
	  	redirect_to photos_path
	  else
	  	flash[:notice] = "You have to be logged in to comment."
	  	redirect_to new_photo_comment_path
	  end
	end

	def comment_params
	  params.require(:comment).permit(:thoughts)
	end
end
