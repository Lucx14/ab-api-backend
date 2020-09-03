class Review < ApplicationRecord
  belongs_to :listing
  belongs_to :reservation
  belongs_to :guest, class_name: :User

  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
