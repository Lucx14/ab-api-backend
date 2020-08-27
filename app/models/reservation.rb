class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: :User
  has_many :reviews

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
end
