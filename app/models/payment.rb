class Payment
	
	# Amount in cents
	def self.charge(customer, amount)
		payment = Stripe::Charge.create(
			:customer 		=> customer.id,
			:amount 			=> amount,
			:description 	=> 'Instachegram picture purchase',
			:currency 		=> 'usd'
		)
	end

end
