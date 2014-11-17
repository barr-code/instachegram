class LikesController < ApplicationController

	def create
    @photo = Photo.find(params[:photo_id])
    like = @photo.likes.new
    like.user_id = current_user.id
    if like.save
    	render json: { new_like_count: @photo.likes.count }
    else
    	redirect_to photos_path	
    end
  end

  # def destroy
  # 	@like = current_user.likes.find(params[:photo_id])
  # 	render json: { new_like_count: @photo.likes.count }	if @like.destroy
  # end 

end
