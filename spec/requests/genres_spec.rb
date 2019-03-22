require 'rails_helper'

RSpec.describe 'Genres API', type: :request do
  # initialize test data
  let!(:genres) { create_list(:genre, 5) }
  let(:genre_id) { genres.first.id }

  # Test suite for GET /genres
  describe 'GET /genres' do
    # make HTTP get request before each example
    before { get '/genres' }

    it 'returns genres' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json['collection'].size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /genres/:id
  describe 'GET /genres/:id' do
    before { get "/genres/#{genre_id}" }

    context 'when the record exists' do
      it 'returns the genre' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(genre_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:genre_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Genre/)
      end
    end
  end

  # Test suite for POST /genres
  describe 'POST /genres' do
    # valid payload
    let(:valid_attributes) { { name: 'XX' } }

    context 'when the request is valid' do
      before { post '/genres', params: valid_attributes }

      it 'creates a genre' do
        expect(json['name']).to eq('XX')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/genres', params: {  } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /genres/:id
  describe 'PUT /genres/:id' do
    let(:valid_attributes) { { name: 'XX' } }

    context 'when the record exists' do
      before { put "/genres/#{genre_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /genres/:id
  describe 'DELETE /genres/:id' do
    before { delete "/genres/#{genre_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
