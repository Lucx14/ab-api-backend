class User < ApplicationRecord
  has_many :listings, foreign_key: :host_id, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end
