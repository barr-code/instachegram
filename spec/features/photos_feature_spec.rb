require 'rails_helper'

describe 'photos' do

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
	end
end
