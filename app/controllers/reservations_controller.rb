class ReservationsController< ApplicationController

	def create

		@listing = Listing.find(params[:listing_id])
		@reservation = @listing.reservations.new(
			user_id: current_user.id,
			listing_id: @listing.id,
			start_date: params[:start_date],
			end_date: params[:end_date])

			# Date authorization method here!

			@reservation.save

		respond_to do |format|
      if @reservation.save
        format.html { redirect_to @listing, notice: 'Awesome, those dates are available.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
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
    params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date)
  end

end