class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: :User
  has_many :reviews

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true

  validate :checkout_date_after_checkin_date

  # https://medium.com/lightthefuse/ruby-on-rails-date-validation-in-a-booking-and-disabling-dates-in-date-picker-3e5b4e9b4640
  # Need to run validations on reservations
  # And we will use the article above to add an extra custom validation to prevent the date ranges crossing over!!

  private

  def checkout_date_after_checkin_date
    return if checkout_date.blank? || checkin_date.blank?

    errors.add(:checkout_date, 'must be after the checkin date') if checkout_date <= checkin_date
  end
end
