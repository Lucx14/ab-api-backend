require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  let(:host) { create(:user) }
  let(:guest) { create(:user) }
  let!(:listing) { create(:listing, host_id: host.id) }
  # let!(:reservation) { create(:reservation, guest_id: guest.id, listing_id: listing.id) }
  let(:listing_id) { listing.id }
  # let(:reservation_id) { reservation.id }

  let(:headers) { valid_guest_headers }

#   describe 'GET /listings/:listing_id/reservations' do
#     before { get "/listings/#{listing_id}/reservations", params: {}, headers: headers }

#     context 'when the listing exists' do
#       it 'returns a status code 200' do
#         expect(response).to have_http_status(:ok)
#       end

#       it 'returns all reservations' do
#         expect(JSON.parse(response.body).size).to eq(1)
#       end
#     end

#     context 'when the listing does not exist' do
#       let(:listing_id) { 100 }

#       it 'returns status code 404' do
#         expect(response).to have_http_status(:not_found)
#       end

#       it 'returns a not found message' do
#         expect(response.body).to match(/Couldn't find Listing/)
#       end
#     end
#   end

#   describe 'GET /listings/:listing_id/reservations/:id' do
#     before { get "/listings/#{listing_id}/reservations/#{reservation_id}" }

#     context 'when the listing reservation exists' do
#       it 'returns a status code 200' do
#         expect(response).to have_http_status(:ok)
#       end

#       it 'returns the reservation' do
#         expect(JSON.parse(response.body)['id']).to eq(reservation_id)
#       end
#     end

#     context 'when the listing reservation does not exist' do
#       let(:reservation_id) { 0 }

#       it 'returns status code 404' do
#         expect(response).to have_http_status(:not_found)
#       end

#       it 'returns a not found message' do
#         expect(response.body).to match(/Couldn't find Reservation/)
#       end
#     end
#   end

  describe 'POST /listings/:listing_id/reservations' do
    context 'when thew request attributes are valid' do
      before { post "/listings/#{listing_id}/reservations", params: valid_reservation_attributes, headers: headers }

      it 'returns a status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request attributes are invalid' do
      before { post "/listings/#{listing_id}/reservations", params: {}, headers: headers }

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Checkin date can't be blank, Checkout date can't be blank/)
      end
    end
  end

#   describe 'PUT /listings/:listing_id/reservations/:id' do
#     let(:new_checkout_date) { Faker::Date.between(from: 5.weeks.from_now, to: 6.weeks.from_now) }
#     let(:valid_attributes) { { checkout_date: new_checkout_date } }

#     before { put "/listings/#{listing_id}/reservations/#{reservation_id}", params: valid_attributes }

#     context 'when the reservation exists' do
#       it 'returns status code 204' do
#         expect(response).to have_http_status(:no_content)
#       end

#       it 'updates the reservation' do
#         updated_reservation = Reservation.find(reservation_id)
#         expect(updated_reservation.checkout_date).to eq(new_checkout_date)
#       end
#     end

#     context 'when the reservation does not exist' do
#       let(:reservation_id) { 0 }

#       it 'returns status code 404' do
#         expect(response).to have_http_status(:not_found)
#       end

#       it 'returns a not found message' do
#         expect(response.body).to match(/Couldn't find Reservation/)
#       end
#     end
#   end

#   describe 'DELETE /listings/:listing_id/reservations/:id' do
#     before { delete "/listings/#{listing_id}/reservations/#{reservation_id}" }

#     it 'returns status code 204' do
#       expect(response).to have_http_status(:no_content)
#     end
#   end
end
