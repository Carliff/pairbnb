class Reservation < ActiveRecord::Base
	validates :start_date, uniqueness: true
	validates :end_date, uniqueness: true

	belongs_to :user
	belongs_to :listing
	has_one :sale
end
