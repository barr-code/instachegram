class IGCustomer

	def self.new_with(email, card)
		customer = Stripe::Customer.create(
			:email 	=> email,
			:card 	=> card
		)
	end
end

