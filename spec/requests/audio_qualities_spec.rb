require 'rails_helper'

RSpec.describe 'Audio Qualities API', type: :request do
  # initialize test data
  let!(:audio_qualities) { create_list(:audio_quality, 5) }
  let(:audio_quality_id) { audio_qualities.first.id }

  # Test suite for GET /audio_qualities
  describe 'GET /audio_qualities' do
    # make HTTP get request before each example
    before { get '/audio_qualities' }

    it 'returns audio qualities' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /audio_qualities/:id
  describe 'GET /audio_qualities/:id' do
    before { get "/audio_qualities/#{audio_quality_id}" }

    context 'when the record exists' do
      it 'returns the audio_quality' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(audio_quality_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:audio_quality_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find AudioQuality/)
      end
    end
  end

  # Test suite for POST /audio_qualities
  describe 'POST /audio_qualities' do
    # valid payload
    let(:valid_attributes) do
      {
        name: 'XX',
        abbr: 'XX',
        position: 1,
        default: false
      }
    end

    context 'when the request is valid' do
      before { post '/audio_qualities', params: valid_attributes }

      it 'creates a audio_quality' do
        expect(json['name']).to eq('XX')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/audio_qualities', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Abbr can't be blank/)
      end
    end
  end

  # Test suite for PUT /audio_qualities/:id
  describe 'PUT /audio_qualities/:id' do
    let(:valid_attributes) { { name: 'XX', abbr: 'xx' } }

    context 'when the record exists' do
      before { put "/audio_qualities/#{audio_quality_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /audio_qualities/:id
  describe 'DELETE /audio_qualities/:id' do
    before { delete "/audio_qualities/#{audio_quality_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
