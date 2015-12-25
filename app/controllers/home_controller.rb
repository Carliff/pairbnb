class HomeController < ApplicationController
  def index
	  	if params[:search]
	      @listings = Listing.where(["city LIKE ?","%#{params[:search]}%"])
	      @listings = Listing.paginate(:page => params[:page], :per_page => 12)
	   else
	      @listings = Listing.all
	      @listings = Listing.paginate(:page => params[:page], :per_page => 12) 
	   end
  end
end
