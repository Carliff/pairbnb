class Search < ActiveRecord::Base

	def search_listings
	
		listings = Listing.all

		listings = listings.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
		listings = listings.where(["category LIKE ?",category]) if category.present?
		listings = listings.where(["price >= ?", min_price]) if min_price.present?
		listings = listings.where(["price <= ?", max_price]) if max_price.present?
		listings = listings.where(["guest LIKE ?",guest]) if guest.present?
		listings = listings.where(["pets", true]) if pets.present?
		listings = listings.where(["smoking", true]) if smoking.present?
		listings = listings.where(["city LIKE ?","%#{city}%"]) if city.present?

		return listings
	end
end
