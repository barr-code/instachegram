class PhotosController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		if current_user
			@photo = Photo.new(params[:photo].permit(:image, :caption))
			@photo.user_id = current_user.id
		end

		if @photo.save
			redirect_to photos_path
		else
			render 'new'
		end
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = current_user.photos.find(params[:id])
    @photo.update(params[:photo].permit(:caption))
    redirect_to photos_path
	end

	def destroy
		@photo = current_user.photos.find(params[:id])
		@photo.destroy
		flash[:notice] = "Photo was deleted successfully"
		redirect_to photos_path
	end
end
