require 'rails_helper'
require_relative './helpers/user_helper'
require_relative './helpers/photo_helper'

describe 'leaving comments' do

	before do
		sign_up
		upload_photo
	end

	it "allows users to leave a comment on a photo" do
		visit '/'
		click_link 'Comment'
		fill_in 'Thoughts', with: "looks good!"
		click_button 'Leave Comment'
		expect(page).to have_content "looks good!"
	end

	it "displays the email address of the user who left the comment" do
		visit '/'
		click_link 'Comment'
		fill_in 'Thoughts', with: "nice stache!"
		click_button 'Leave Comment'
		expect(page).to have_content "test@user.com"
	end

	it "doesn't let users post photos if they're not logged in" do
		visit '/'
		click_link 'Sign out'
		click_link 'Comment'
		fill_in 'Thoughts', with: 'This should not post'
		click_button 'Leave Comment'
		expect(page).to have_content 'You have to be logged in to comment.'
	end


end