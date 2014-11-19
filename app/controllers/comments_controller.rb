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
	  @comment.user_id = current_user.id
	  redirect_to photos_path if @comment.save
	end

	def comment_params
	  params.require(:comment).permit(:thoughts)
	end
end
