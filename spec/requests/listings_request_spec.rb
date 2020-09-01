require 'rails_helper'

RSpec.describe 'Listings', type: :request do
  let(:user) { create(:user) }
  let!(:listings) { create_list(:listing, 10, host_id: user.id) }
  let(:listing_id) { listings.first.id }

  let(:headers) { valid_headers }

  describe 'GET /listings' do
    before { get '/listings', params: {}, headers: headers }

    it 'returns listings' do
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body).length).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /listings/:id' do
    before { get "/listings/#{listing_id}", params: {}, headers: headers }

    context 'when a record exists' do
      it 'returns the listing' do
        expect(response.body).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(listing_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the record does not exist' do
      let(:listing_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        expect(response.body).to match(/Couldn't find Listing/)
      end
    end
  end

  describe 'POST /listings' do
    context 'when the request is valid' do
      before { post '/listings', params: valid_listing_attributes, headers: headers }

      it 'creates a listing' do
        expect(JSON.parse(response.body)['long_description'])
          .to eq(JSON.parse(valid_listing_attributes)['long_description'])
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before { post '/listings', params: invalid_listing_attributes, headers: headers }

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a validation vailure message' do
        expect(JSON.parse(response.body)['message']).to match(/Validation failed: Listing type can't be blank/)
      end
    end
  end

  describe 'PUT /listings/:id' do
    context 'when the record exists' do
      before { put "/listings/#{listing_id}", params: valid_listing_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns a status code 204' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe 'DELETE /listings/:id' do
    before { delete "/listings/#{listing_id}", params: {}, headers: headers }

    it 'returns a status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
