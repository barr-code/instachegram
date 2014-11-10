require 'rails_helper'
require_relative 'helpers/photo_helper'
require_relative 'helpers/user_helper'

context 'user not signed in' do

	it 'has a "sign in" link and a "sign up" link' do
		visit '/'
		expect(page).to have_link 'Sign in'
		expect(page).to have_link 'Sign up'
	end

	it 'does not have a "sign out" link when no one is signed in' do
		visit '/'
		expect(page).not_to have_link 'Sign out'
	end

end

context 'user is signed in' do

	before do
		sign_up
	end

	it 'has a "sign out" link' do
		visit '/'
		expect(page).to have_link 'Sign out'
	end

	it 'does not have a "sign up" link' do
		visit '/'
		expect(page).not_to have_link 'Sign up'
	end

	it 'does not have a "sign in" link' do
		visit '/'
		expect(page).not_to have_link 'Sign in'
	end
end

context 'user photos' do

	it 'must be signed in to add photos' do
		visit '/'
		click_link 'Add a photo'
		expect(page).to have_content 'You need to sign in or sign up before continuing.'
	end

	it 'cannot delete photos someone else uploaded' do
		sign_up
		upload_photo
		expect(page).to have_content 'Delete photo'
		click_link 'Sign out'
		sign_up("different@user.com", "password")
		expect(page).not_to have_content 'Delete photo'
	end

	it "cannot edit captions on other people's photos" do
		sign_up
		upload_photo
		expect(page).to have_content 'Edit caption'
		click_link 'Sign out'
		sign_up("different@user.com", "password")
		expect(page).not_to have_content 'Edit caption'
	end
end