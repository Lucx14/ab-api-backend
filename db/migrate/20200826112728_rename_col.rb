class RenameCol < ActiveRecord::Migration[6.0]
  def change
    rename_column :listings, :home_type, :listing_type
  end
end
