class AddGuidToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :guid, :string
  end
end
