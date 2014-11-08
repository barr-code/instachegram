class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.create(params[:photo].permit(:image, :caption))
		redirect_to photos_path
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
    @photo.update(params[:photo].permit(:caption))
    redirect_to photos_path
	end
end
