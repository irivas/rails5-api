require 'rails_helper'

RSpec.describe 'Video Qualities API', type: :request do
  # initialize test data
  let!(:video_qualities) { create_list(:video_quality, 5) }
  let(:video_quality_id) { video_qualities.first.id }

  # Test suite for GET /video_qualities
  describe 'GET /video_qualities' do
    # make HTTP get request before each example
    before { get '/video_qualities' }

    it 'returns video qualities' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json['collection'].size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /video_qualities/:id
  describe 'GET /video_qualities/:id' do
    before { get "/video_qualities/#{video_quality_id}" }

    context 'when the record exists' do
      it 'returns the video_quality' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(video_quality_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:video_quality_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find VideoQuality/)
      end
    end
  end

  # Test suite for POST /video_qualities
  describe 'POST /video_qualities' do
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
      before { post '/video_qualities', params: valid_attributes }

      it 'creates a video_quality' do
        expect(json['name']).to eq('XX')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/video_qualities', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Abbr can't be blank/)
      end
    end
  end

  # Test suite for PUT /video_qualities/:id
  describe 'PUT /video_qualities/:id' do
    let(:valid_attributes) { { name: 'XX', abbr: 'xx' } }

    context 'when the record exists' do
      before { put "/video_qualities/#{video_quality_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /video_qualities/:id
  describe 'DELETE /video_qualities/:id' do
    before { delete "/video_qualities/#{video_quality_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
