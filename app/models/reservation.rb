class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: :User
  has_many :reviews

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true

  # https://medium.com/lightthefuse/ruby-on-rails-date-validation-in-a-booking-and-disabling-dates-in-date-picker-3e5b4e9b4640
  # Need to run validations on reservations
  # end date must be after start date
  # validate :end_date_after_start_date
  # And we will use the article above to add an extra custom validation to prevent the date ranges crossing over!!
  # example
  # def end_date_after_start_date
  #   return if end_date.blank? || start_date.blank?
  #   if end_date < start_date
  #     errors.add(:end_date, "must be after the start date")
  #   end
  # end
end
