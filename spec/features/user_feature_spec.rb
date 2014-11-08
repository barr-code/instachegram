require 'rails_helper'

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