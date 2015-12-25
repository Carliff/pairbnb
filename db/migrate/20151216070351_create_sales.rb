class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :buyer_email
      t.string :seller_email
      t.integer :amount
      t.string :guid
      t.integer :listing_id
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
