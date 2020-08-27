class AddForeignKeysToReservations < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :guest, references: :users, null: false, foreign_key: { to_table: :users }
    add_reference :reservations, :listing, null: false, foreign_key: true
  end
end
