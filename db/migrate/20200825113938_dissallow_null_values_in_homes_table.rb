class DissallowNullValuesInHomesTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :homes, :home_type, false
    change_column_null :homes, :short_description, false
    change_column_null :homes, :long_description, false
    change_column_null :homes, :total_occupancy, false
    change_column_null :homes, :total_bedrooms, false
    change_column_null :homes, :total_beds, false
  end
end
