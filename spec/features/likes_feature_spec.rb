require 'rails_helper'
require_relative './helpers/photo_helper'
require_relative './helpers/user_helper'

describe 'liking photos' do

	before do
		sign_up
		upload_photo
	end

	it 'users can like photos, update like count', js: true do
		visit '/'
		click_link 'Like'
		expect(page).to have_content '1 like'
	end

	it 'users can like each photo once', js: true do
		visit '/'
		click_link 'Like'
		expect(page).to have_content '1 like'
		expect(page).not_to have_link 'Like'
	end

end