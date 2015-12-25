class TransactionsController< ApplicationController
	def create
		listing = Listing.find_by!(slug: params[:slug])

		sale = listing.sales.create(
			amount: listing.price, 
			buyer_email: current_user.email, 
			seller_email: listing.user.email,
			user_id: current_user.id, 
			stripe_token: params[:stripeToken])
		sale.process!

		sale.reservation_id = listing.reservations.last.id #.update

		if sale.finished?

			sale.update(guid: listing.reservations.last.guid)
			redirect_to pickup_url(guid: sale.guid)
		else
			redirect_to listing_path(listing), notice: @error 
		end
	end

	def pickup

		@sale = Sale.create(guid: params[:guid])
		@reservation = Reservation.find_by(guid:params[:guid])
		if @reservation
		@whatever = @reservation.listing.slug
	else
		
		Listing.find(Sale.find_by(guid: params[:guid]).listing_id).slug
	end
	end
end