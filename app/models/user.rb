class User < ApplicationRecord
  has_many :listings, foreign_key: :host_id, dependent: :destroy
  has_many :reservations, through: :listings
  has_many :reviews, foreign_key: :guest_id
  has_many :trips, foreign_key: :guest_id, class_name: :Reservation

  validates :first_name, presence: true
  validates :last_name, presence: true
end
