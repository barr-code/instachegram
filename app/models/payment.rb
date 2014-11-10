class Payment
	
	# Amount in cents
	def create(user, amount)
		payment = Stripe::Charge.create(
			:customer 		=> user,
			:amount 			=> amount,
			:description 	=> 'Instachegram picture purchase'
			:currency 		=> 'usd'
		)
	end

end
