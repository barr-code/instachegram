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
			Photo.create(caption: "#nofilter")
		end

		it 'displays photos' do
			visit '/photos'
			expect(page).to have_content "#nofilter"
			expect(page).not_to have_content "No photos (yet)."
		end
	end
end
