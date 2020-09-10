require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:user_id' do
    let(:headers) { valid_headers }
    let(:user) { create(:user) }

    before { get "/users/#{user_id}", params: {}, headers: headers }

    context 'when the record exists' do
      let(:user_id) { user.id }

      it 'returns the user' do
        expect(response.body).not_to be_empty
        expect(JSON.parse(response.body)['email']).to eq(user.email)
      end

      it 'returns a status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(JSON.parse(response.body)['message']).to match(/Couldn't find User/)
      end
    end

    context 'when the user is not the profile owner' do
      let(:other_user) { create(:user) }
      let(:user_id) { other_user.id }

      it 'returns status code 401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns a permission denied message' do
        expect(JSON.parse(response.body)['message']).to match(/Permission denied/)
      end
    end
  end

  describe 'POST /signup' do
    let(:user) { build(:user) }
    let(:headers) { valid_headers.except('Authorization') }
    let(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }

    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(:created)
      end

      it 'returns a success message' do
        expect(JSON.parse(response.body)['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(JSON.parse(response.body)['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns failure message' do
        # rubocop:disable Layout/LineLength
        expect(JSON.parse(response.body)['message']).to match("Validation failed: Password can't be blank, First name can't be blank, Last name can't be blank, Email can't be blank, Email is invalid, Password digest can't be blank")
        # rubocop:enable Layout/LineLength
      end
    end
  end
end
