class Listing < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, use: :slugged 

	belongs_to :user
	has_many :sales, :through => :reservations
	has_many :reservations


	has_attached_file :image 
	has_attached_file :resource


	validates_numericality_of :price, 
		greather_then: 49, message: "Must be at least 50 cents"


	validates_attachment_content_type :image, 
		content_type:  /^image\/(png|gif|jpeg)/,
		message: "Only images allowed"
	validates_attachment_content_type :resource, 
		content_type: ['application/pdf'],
		message: "Only pdfs allowed"	

	validates :image, attachment_presence: true 
	# validates :resource, attachment_presence: true 



	 def self.search(search)
    if search
    	byebug
        @listings = Listing.where(["name LIKE ?","%#{params[:search]}%"])
    else
        all
    end
  end
end
