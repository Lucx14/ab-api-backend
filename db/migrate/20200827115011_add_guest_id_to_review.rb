class AddGuestIdToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :guest, references: :users, null: false, foreign_key: { to_table: :users }
  end
end
