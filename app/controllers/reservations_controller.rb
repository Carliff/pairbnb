class ReservationsController< ApplicationController

	# protect_from_forgery
	def new
		@listing = Listing.friendly.find(params[:listing_id])
	end

	def create
		# byebug
		@listing = Listing.find(params[:listing_id])
		@reservation = @listing.reservations.new(reservation_params)
		@reservation.user_id = current_user.id
		# @reservation.save

		respond_to do |format|
      if @reservation.save
        
        # byebug
        format.html { redirect_to new_listing_reservation_path(@listing), notice: 'Awesome, dates are available.' }
        format.json { render :show, status: :created, location: @listing }

      else
        format.html { redirect_to @listing, notice: 'Error, date not available.' }
        format.json { render :show, status: :created, location: @listing }
      end
    end

		
		# if @reservation.authenticate?
		# 	redirect_to pickup_url(guid: @reservation.guid)
		# else
		# 	redirect_to listing_path(@listing), notice: @error 
		# end
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

		# Never trust parameters from the scary internet, only allow the white list through.
	  def reservation_params
	    params.require(:reservation).permit(:id, :user_id, :listing_id, :start_date, :end_date)
	  end

end