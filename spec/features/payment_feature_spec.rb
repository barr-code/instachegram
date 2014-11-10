require 'rails_helper'

describe 'making payments' do

	context 'visiting the payment page' do
		
		it 'has a pay button', js: true do
			visit '/payments/new'
			expect(page).to have_content 'Amount'
			expect(page).to have_button 'Pay with Card' 
		end

		it 'has a pay form', js: true do
			visit '/payments/new'
			click_button 'Pay with Card'
			expect(page).to have_selector 'iframe'
		end

		it 'takes user information', js: true do
			visit '/payments/new'
			click_button 'Pay with Card'
			stripe_iframe = all('iframe[name=stripe_checkout_app]').last
			Capybara.within_frame stripe_iframe do
				expect(page).to have_content 'Buy photo'
				expect(page).to have_button 'Pay $1.00'
			end
		end
	end
end
