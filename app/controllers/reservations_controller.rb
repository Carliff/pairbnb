class ReservationsController< ApplicationController
	def create

		@listing = Listing.find(params[:listing_id])
		@reservation = @listing.reservations.create(
			start_date: params[:start_date],
			end_date: params[:end_date])
		

		if @reservation.authenticate?
			redirect_to pickup_url(guid: @reservation.guid)
		else
			redirect_to listing_path(@listing), notice: @error 
		end
	end

	def post

	end

	def show
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.friendly.find(params[:id])
    end

	def pickup
		@reservation = Reservation.find_by!(guid: params[:guid])
		@listing = @reservation.listing
	end
end