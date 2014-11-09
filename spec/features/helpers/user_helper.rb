def sign_up
	visit '/'
	click_link 'Sign up'
	fill_in 'Email', with: 'test@user.com'
	fill_in 'Password', with: 'testpass'
	fill_in 'Password confirmation', with: 'testpass'
	click_button 'Sign up'
end