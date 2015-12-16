class TransactionsController< ApplicationController
	def create
		listing = Listing.find_by!(slug: params[:slug])
		token = params[:stripeToken]

		begin
			
			charge = Stripe::Charge.create(
				amount: listing.price,
				currency: "usd",
				card: token,
				description: current_user.email)

			@sale = listing.sales.create!(buyer_email: current_user.email)
			redirect_to pickup_url(guid: @sale.guid)
		
		rescue Stripe::CardError => e 
			@error = e 
			redirect_to listing_path(listing), notice: @error
		end 

		end
	end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@listing = @sale.listing
	end
end