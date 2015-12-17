class Reservation < ActiveRecord::Base
	
	before_create :populate_guid

	validates :start_date, uniqueness: true
	validates :end_date, uniqueness: true

	belongs_to :user
	belongs_to :listing
	has_one :sale

# private

	def populate_guid

			self.guid = SecureRandom.uuid()
		end
end
