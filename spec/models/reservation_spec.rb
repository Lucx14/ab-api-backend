require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:listing) }
    it { is_expected.to belong_to(:guest) }
    it { is_expected.to have_many(:reviews) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:checkin_date) }
    it { is_expected.to validate_presence_of(:checkout_date) }
  end
end
