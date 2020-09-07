class Reservation < ApplicationRecord
  # custom activeModel validator
  class AvailabilityValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      reservations = Reservation.where('listing_id = ?', record.listing_id)
      date_ranges = reservations.map { |r| r.checkin_date..r.checkout_date }
      date_ranges.each do |range|
        record.errors.add(attribute, 'not available') if range.include? value
      end
    end
  end

  belongs_to :listing
  belongs_to :guest, class_name: :User
  has_many :reviews

  validates :checkin_date, :checkout_date, presence: true, availability: true
  validate :checkout_date_after_checkin_date

  private

  def checkout_date_after_checkin_date
    return if checkout_date.blank? || checkin_date.blank?

    errors.add(:checkout_date, 'must be after the checkin date') if checkout_date <= checkin_date
  end
end
