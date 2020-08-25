class HomesCorrectNullValues < ActiveRecord::Migration[6.0]
  def change
    change_column_null :homes, :has_kitchen, true
    change_column_null :homes, :has_wifi, true
    change_column_null :homes, :has_tv, true
    change_column_null :homes, :has_air_con, true
  end
end
