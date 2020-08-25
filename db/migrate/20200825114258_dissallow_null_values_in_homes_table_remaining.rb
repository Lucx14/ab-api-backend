class DissallowNullValuesInHomesTableRemaining < ActiveRecord::Migration[6.0]
  def change
    change_column_null :homes, :country, false
    change_column_null :homes, :city, false
    change_column_null :homes, :street, false
    change_column_null :homes, :house_number, false
    change_column_null :homes, :post_code, false
    change_column_null :homes, :latitude, false
    change_column_null :homes, :longitude, false
    change_column_null :homes, :has_kitchen, false
    change_column_null :homes, :has_wifi, false
    change_column_null :homes, :has_tv, false
    change_column_null :homes, :has_air_con, false
  end
end
