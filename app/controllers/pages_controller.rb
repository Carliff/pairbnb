class PagesController < ApplicationController
	# make sure users are logged in.
  before_action :authorize, only: [:dashboard]

  def home
  	if current_user
  		redirect_to listings_path
  	end
  	@listings = Listing.last(4)
  end
  
  def dashboard
  	@listings = current_user.listings
    @purchased = Sale.where(buyer_email: current_user.email)
    @sales = Sale.where(seller_email: current_user.email)
  end
  
end
