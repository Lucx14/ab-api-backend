class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  # Encrypt password
  has_secure_password

  has_many :listings, foreign_key: :host_id, dependent: :destroy
  has_many :reservations, through: :listings
  has_many :reviews, foreign_key: :guest_id
  has_many :trips, foreign_key: :guest_id, class_name: :Reservation

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password_digest, presence: true
end
