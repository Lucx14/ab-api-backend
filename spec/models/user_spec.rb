require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:password_digest) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(105) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.not_to allow_value('test').for(:email) }
    it { is_expected.to allow_value('testing@email.com').for(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:listings) }
    it { is_expected.to have_many(:reservations).through(:listings) }
    it { is_expected.to have_many(:reviews) }
  end
end
