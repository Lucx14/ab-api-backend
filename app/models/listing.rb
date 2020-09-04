class Listing < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :host, class_name: :User

  has_many_attached :images

  has_many :reservations, dependent: :destroy
  has_many :guests, through: :reservations
  has_many :reviews, through: :reservations

  validates :listing_type, presence: true
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
  validates :price_per_night, presence: true

  # poss validations?? think there is a gem too?
  # validates :images, presence: true,
  # blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes }

  def image_urls
    images.map { |image| url_for(image) }
  end
end
