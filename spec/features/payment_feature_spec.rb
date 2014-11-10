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
			find('.stripe-button-el').click
			sleep(6)
			stripe_iframe = all('iframe[name=stripe_checkout_app]').last
			
			Capybara.within_frame stripe_iframe do
				fill_in :email, with: 'hello@testme.com'
				fill_in :card_number, with: '4242424242424242'
				fill_in :'cc-exp', with: '1280'
				fill_in :'cc-csc', with: '123'
				save_and_open_page
				click_button :submitButton
				expect(page).to have_content 'Buy photo'
				expect(page).to have_button 'Pay $1.00'
			end
			
			# sleep(60)
			expect(page).to have_content('Thanks, you paid')
		end


	end
end
