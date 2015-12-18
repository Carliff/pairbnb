class TransactionsController< ApplicationController
	def create
		listing = Listing.find_by!(slug: params[:slug])
		# byebug

		sale = listing.sales.create(
			amount: listing.price, 
			buyer_email: current_user.email, 
			seller_email: listing.user.email,
			user_id: current_user.id,
			# start_date: params[:start_date],
			# end_date: params[:end_date], 
			stripe_token: params[:stripeToken])
		sale.process!

		sale.reservation_id = listing.reservations.last.id #.update

		if sale.finished?
			# byebug
			redirect_to pickup_url(guid: sale.guid)
		else
			redirect_to listing_path(listing), notice: @error 
		end
	end

	def pickup
		# byebug
		@sale = Sale.find_by!(guid: params[:guid])
		@listing = @sale.listing
	end
end