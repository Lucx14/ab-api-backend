require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let(:host) { create(:user) }
  let(:guest) { create(:user) }
  let!(:listing) { create(:listing, host_id: host.id) }
  let!(:reservation) { create(:reservation, guest_id: guest.id, listing_id: listing.id) }
  let(:listing_id) { listing.id }
  let(:trip_id) { reservation.id }

  let(:headers) { valid_guest_headers }

  describe 'POST /trips/:trip_id/reviews' do
    context 'when thew request attributes are valid' do
      before { post "/trips/#{trip_id}/reviews", params: valid_review_attributes, headers: headers }

      it 'returns a status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request attributes are invalid' do
      before { post "/trips/#{trip_id}/reviews", params: invalid_review_attributes, headers: headers }

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Rating can't be blank/)
      end
    end
  end
end
