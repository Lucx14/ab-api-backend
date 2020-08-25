require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  let!(:homes) { create_list(:home, 10) }
  let(:home_id) { homes.first.id }

  describe 'GET /homes' do
    before { get '/homes/' }

    it 'returns homes' do
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body).length).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /homes/:id' do
    before { get "/homes/#{home_id}" }

    context 'when a record exists' do
      it 'returns the home' do
        expect(response.body).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(home_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the record does not exist' do
      let(:home_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        expect(response.body).to match(/Couldn't find Home/)
      end
    end
  end

  describe 'POST /homes' do
    context 'when the request is valid' do
      before { post '/homes', params: valid_home_attributes }

      it 'creates a home' do
        expect(JSON.parse(response.body)['long_description']).to eq(valid_home_attributes[:long_description])
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before { post '/homes', params: invalid_home_attributes }

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a validation vailure message' do
        expect(JSON.parse(response.body)['message']).to match(/Validation failed: Home type can't be blank/)
      end
    end
  end

  describe 'PUT /homes/:id' do
    context 'when the record exists' do
      before { put "/homes/#{home_id}", params: valid_home_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns a status code 204' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe 'DELETE /homes/:id' do
    before { delete "/homes/#{home_id}" }

    it 'returns a status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
