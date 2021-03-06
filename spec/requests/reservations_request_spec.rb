require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  let(:host) { create(:user) }
  let(:guest) { create(:user) }
  let!(:listing) { create(:listing, host_id: host.id) }
  let(:listing_id) { listing.id }

  let(:headers) { valid_guest_headers }

  describe 'POST /listings/:listing_id/reservations' do
    context 'when thew request attributes are valid' do
      before { post "/listings/#{listing_id}/reservations", params: valid_reservation_attributes, headers: headers }

      it 'returns a status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request attributes are invalid' do
      before { post "/listings/#{listing_id}/reservations", params: invalid_reservation_attributes, headers: headers }

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Checkin date can't be blank, Checkout date can't be blank/)
      end
    end
  end
end
