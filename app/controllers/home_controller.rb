class HomeController < ApplicationController
  def index
  	if params[:search]
      @listings = Listing.where(["city LIKE ?","%#{params[:search]}%"])
    else
      @listings = Listing.all 
    end
  end
end
