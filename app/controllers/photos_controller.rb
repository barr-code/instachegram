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
end
