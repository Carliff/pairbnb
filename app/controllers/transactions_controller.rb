class TransactionsController< ApplicationController
	def create
		listing = Listing.find_by!(slug: params[:slug])
		sale = listing.sales.create(
			amount: listing.price, 
			buyer_email: current_user.email, 
			seller_email: listing.user.email,
			reservation_id: params[:reservation_id], 
			stripe_token: params[:stripeToken])
		sale.process!

		if sale.finished?
			redirect_to pickup_url(guid: sale.guid)
		else
			redirect_to listing_path(listing), notice: @error 
		end
	end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@listing = @sale.listing
	end
end