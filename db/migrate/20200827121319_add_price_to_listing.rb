class AddPriceToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :price_per_night, :decimal, precision: 8, scale: 2, null: false 
  end
end
