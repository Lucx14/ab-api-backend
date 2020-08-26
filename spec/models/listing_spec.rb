require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:listing_type) }
    it { is_expected.to validate_presence_of(:short_description) }
    it { is_expected.to validate_presence_of(:long_description) }

    it { is_expected.to validate_presence_of(:total_occupancy) }
    it { is_expected.to validate_numericality_of(:total_occupancy).is_greater_than(0).is_less_than(11) }
    it { is_expected.to validate_presence_of(:total_bedrooms) }
    it { is_expected.to validate_numericality_of(:total_bedrooms).is_greater_than(0).is_less_than(11) }
    it { is_expected.to validate_presence_of(:total_beds) }
    it { is_expected.to validate_numericality_of(:total_beds).is_greater_than(0).is_less_than(11) }

    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:house_number) }
    it { is_expected.to validate_presence_of(:post_code) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_numericality_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_numericality_of(:longitude) }
  end
end
