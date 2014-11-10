class Customer

	def create(email, card)
		customer = Stripe::Customer.create(
			:email 	=> email,
			:card 	=> card
		)
	end
end
