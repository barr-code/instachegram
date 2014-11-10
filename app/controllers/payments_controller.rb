require_relative '../models/customer'

class PaymentsController < ApplicationController
	
	def new
	end

	def create
		@amount = 100
		customer = IGCustomer.new_with(params[:email], params[:stripeToken])
		payment = Payment.charge(customer, @amount)
	end

rescue Stripe::CardError => e
	flash[:error] = e.message
	redirect_to charges_path

end
