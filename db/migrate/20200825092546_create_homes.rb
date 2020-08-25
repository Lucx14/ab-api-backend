class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :type
      t.string :short_description
      t.string :long_description
      t.integer :total_occupancy
      t.integer :total_bedrooms
      t.integer :total_beds
      t.string :country
      t.string :city
      t.string :street
      t.string :house_number
      t.string :post_code
      t.float :latitude
      t.float :longitude
      t.boolean :has_kitchen
      t.boolean :has_wifi
      t.boolean :has_tv
      t.boolean :has_air_con

      t.timestamps
    end
  end
end
