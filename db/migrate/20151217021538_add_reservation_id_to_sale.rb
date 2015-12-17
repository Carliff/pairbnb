class AddReservationIdToSale < ActiveRecord::Migration
  def change
    add_column :sales, :reservation_id, :integer
  end
end
