class RenameTypeToHomeType < ActiveRecord::Migration[6.0]
  def change
    rename_column :homes, :type, :home_type
  end
end
