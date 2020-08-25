class Home < ApplicationRecord
  validates :home_type, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: true
  validates :total_occupancy, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 11 }
  validates :total_bedrooms, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 11 }
  validates :total_beds, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 11 }
  validates :country, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :house_number, presence: true
  validates :post_code, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
