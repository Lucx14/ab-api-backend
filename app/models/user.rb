class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_secure_password

  has_one_attached :avatar

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

  after_create :attach_default_avatar_if_not_provided

  def avatar_url
    url_for(avatar)
  end

  def attach_default_avatar_if_not_provided
    return if avatar.attached?

    avatar_path = "#{::Rails.root}/storage/defaults/default_avatar.png"
    avatar.attach(io: File.open(avatar_path), filename: 'default_avatar.png', content_type: 'image/png')
  end
end
