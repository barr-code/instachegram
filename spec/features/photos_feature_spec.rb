require 'rails_helper'
require_relative './helpers/photo_helper'
require_relative './helpers/user_helper'

describe 'photos' do

	before do
		sign_up
	end

	context 'there are no photos' do

		it 'prompts the user to add a photo' do
			visit '/photos'
			expect(page).to have_content 'No photos (yet).'
			expect(page).to have_link 'Add a photo'
		end
	end

	context 'there are photos' do

		before do
			Photo.create(image: File.open("#{Rails.root}/spec/fixtures/squares.jpg"), caption: "#nofilter")
		end

		xit 'displays photos' do
			visit '/photos'
			expect(page).to have_content "#nofilter"
			expect(page).not_to have_content "No photos (yet)."
			expect(page).to have_selector "img"
		end
	end

	context 'uploading photos through the web' do

		it 'has a photo upload form' do
			visit '/photos'
			click_link 'Add a photo'
			expect(current_path).to eq '/photos/new'
			expect(page).to have_content 'Upload your photo'
		end

		it 'photos can be attached via the form' do
			visit '/photos'
			upload_photo
			expect(page).to have_content 'Wow, such squares'
			expect(current_path).to eq '/photos'
		end
	end

	context 'photo management' do

		it 'photo captions can be edited' do
			visit '/photos'
			upload_photo
      click_link 'Edit caption'
      fill_in 'Caption', with: '#notallrectangles' 
      click_button 'Update Photo'
      expect(page).to have_content '#notallrectangles'
		end

		it 'photos can be deleted' do
			visit '/photos'
			upload_photo
			click_link 'Delete photo'
			expect(current_path).to eq '/photos'
			expect(page).not_to have_content 'Wow, such squares'
			expect(page).to have_content 'Photo was deleted successfully'
		end
	end
end
