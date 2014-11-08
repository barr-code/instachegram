class Photo < ActiveRecord::Base

	has_attached_file :image, styles: {small: "100x100", med: "250x250", large: "500x500"}, :default_url => "/images/:style/squares.jpg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
