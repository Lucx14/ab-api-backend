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

  describe 'custom validations' do
    subject(:bad_reservation) { reservation }

    let(:host) { create(:user) }
    let(:guest) { create(:user) }
    let!(:listing) { create(:listing, host_id: host.id) }
    let(:listing_id) { listing.id }
    let(:reservation) do
      described_class.new(
        checkin_date: '2020-10-10',
        checkout_date: '2020-09-09',
        guest_id: guest.id,
        listing_id: listing_id
      )
    end

    it 'validates checkout date is after checkin date' do
      expect(bad_reservation).not_to be_valid
    end
  end

  describe 'custom validations 2' do
    subject(:double_booked_reservation) { reservation3 }

    let(:host) { create(:user) }
    let(:guest) { create(:user) }
    let!(:listing) { create(:listing, host_id: host.id) }
    let(:listing_id) { listing.id }

    let(:reservation3) do
      described_class.new(
        checkin_date: '2020-06-09',
        checkout_date: '2020-06-15',
        guest_id: guest.id,
        listing_id: listing_id
      )
    end

    before do
      create(:reservation, checkin_date: '2020-06-01',
                           checkout_date: '2020-06-10',
                           guest_id: guest.id,
                           listing_id: listing.id)
      create(:reservation, checkin_date: '2020-06-20',
                           checkout_date: '2020-06-30',
                           guest_id: guest.id,
                           listing_id: listing.id)
    end

    it 'validates booking does not conflict with another reservation' do
      expect(reservation3).not_to be_valid
    end
  end
end
