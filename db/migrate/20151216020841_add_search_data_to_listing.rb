class AddSearchDataToListing < ActiveRecord::Migration
  def change
    add_column :listings, :category, :string
    add_column :listings, :min_price, :decimal
    add_column :listings, :max_price, :decimal
    add_column :listings, :guest, :integer
    add_column :listings, :smoking, :boolean
    add_column :listings, :pets, :boolean
  end
end
