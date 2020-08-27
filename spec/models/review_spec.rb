require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:listing) }
    it { is_expected.to belong_to(:reservation) }
    it { is_expected.to belong_to(:guest) }
  end
end
