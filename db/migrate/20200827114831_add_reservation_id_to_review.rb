class AddReservationIdToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :reservation, null: false, foreign_key: true
  end
end
