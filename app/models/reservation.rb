class Reservation < ActiveRecord::Base
	
	before_create :populate_guid
	# , :check_overlap?

	#validates :start_date, :end_date, :overlap => true

	# validates :start_date, :end_date, :overlap => {:exclude_edges => [:start_date, :end_date]}

	validates :start_date, :end_date, presence: true

	belongs_to :user
	belongs_to :listing
	has_one :sale

# private

	def populate_guid
			self.guid = SecureRandom.uuid()
	end

	# def check_overlap?(other)
	# 	(start_date - other.end_date) * (other.start_date - end_date) >= 0	
	# end
end
