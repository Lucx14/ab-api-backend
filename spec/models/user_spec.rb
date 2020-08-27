require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:listings) }
    it { is_expected.to have_many(:reservations).through(:listings) }
    it { is_expected.to have_many(:reviews) }
  end
end
