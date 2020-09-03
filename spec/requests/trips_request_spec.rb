require 'rails_helper'

RSpec.describe 'Trips', type: :request do
  let(:host) { create(:user) }
  let(:guest) { create(:user) }
  let!(:listing) { create(:listing, host_id: host.id) }
  let!(:reservation) { create(:reservation, guest_id: guest.id, listing_id: listing.id) }
  let(:listing_id) { listing.id }
  let(:reservation_id) { reservation.id }

  let(:headers) { valid_guest_headers }

  describe 'GET /trips' do
    before { get '/trips', params: {}, headers: headers }

    it 'returns trips' do
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body).length).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /trips/:id' do
    before { get "/trips/#{reservation_id}", params: {}, headers: headers }

    context 'when a record exists' do
      it 'returns the trip' do
        expect(response.body).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(reservation_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the record does not exist' do
      let(:reservation_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        expect(response.body).to match(/Couldn't find Reservation/)
      end
    end
  end
end
