class AddUserToHomes < ActiveRecord::Migration[6.0]
  def change
    add_reference :homes, :host, references: :users, null: false, foreign_key: { to_table: :users }
  end
end
