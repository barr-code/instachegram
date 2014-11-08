def upload_photo
	click_link 'Add a photo'
	attach_file 'Image', 'spec/fixtures/squares.jpg'
	fill_in 'Caption', with: 'Wow, such squares'
	click_button 'Create Photo'
end