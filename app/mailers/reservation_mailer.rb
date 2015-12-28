class ReservationMailer < ApplicationMailer
	
	def booking_email(customer, host, reservation_id)
		@url = "http://localhost:3000/dashboard"
		host = @host
		customer = @customer
		mail(to: @host, subject: "You have received a booking from #{@customer}" )
	end

end
