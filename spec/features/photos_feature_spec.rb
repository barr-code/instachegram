require 'rails_helper'

describe 'photos' do

	context 'there are no photos' do

		it 'prompts the user to add a photo' do
			visit '/photos'
			expect(page).to have_content 'No photos (yet).'
			expect(page).to have_link 'Add a photo'

		end
	end
end
