require 'rails_helper'

RSpec.describe 'Movies API', type: :request do
  # initialize test data
  let!(:movies) { create_list(:movie, 5) }
  let(:movie_id) { movies.first.id }
  let!(:audio_quality) { create(:audio_quality) }
  let(:audio_quality_id) { audio_quality.id }

  # Test suite for GET /movies
  describe 'GET /movies' do
    # make HTTP get request before each example
    before { get '/movies' }

    it 'returns movies' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json['collection'].size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /movies/:id
  describe 'GET /movies/:id' do
    before { get "/movies/#{movie_id}" }

    context 'when the record exists' do
      it 'returns the movie' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(movie_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      context 'and has no audio qualities' do
        it 'returns empty audio qualities' do
          expect(json['audio_qualities']).to be_empty
        end
      end

      context 'and has audio qualities' do
        before do
          create(:audio_qualities_movie,
            movie_id: movie_id,
            audio_quality_id: audio_quality_id)
          get "/movies/#{movie_id}"
        end

        it 'returns the audio qualities' do
          expect(json['audio_qualities'].first['id']).to eq(audio_quality_id)
        end
      end
    end

    context 'when the record does not exist' do
      let(:movie_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Movie/)
      end
    end
  end

  # Test suite for POST /movies
  describe 'POST /movies' do
    # valid payload
    let(:valid_attributes) { { title: 'Matrix', year: 2012 } }

    context 'when the request is valid' do
      before { post '/movies', params: valid_attributes }

      it 'creates a movie' do
        expect(json['title']).to eq('Matrix')
        expect(json['year']).to eq(2012)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request has audio quality attributes' do
      let(:movie_attributes) do
        {
          title: 'Dumbo',
          year: 1950,
          audio_quality_ids: [audio_quality_id]
        }
      end
      before { post '/movies', params: movie_attributes }

      it 'creates a movie' do
        expect(json['title']).to eq('Dumbo')
        expect(json['year']).to eq(1950)
      end

      it 'returns the audio qualities' do
        expect(json['audio_qualities'].first['id']).to eq(audio_quality_id)
      end
    end

    context 'when the request is invalid' do
      before { post '/movies', params: { title: 'Matrix' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Year can't be blank/)
      end
    end
  end

  # Test suite for PUT /movies/:id
  describe 'PUT /movies/:id' do
    let(:valid_attributes) { { title: 'Dumbo' } }

    context 'when the record exists' do
      before { put "/movies/#{movie_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the request has audio quality attributes' do
      let(:movie_attributes) do
        {
          title: 'La venganza del conde de MonteCristo',
          year: 1999,
          audio_quality_ids: [audio_quality_id]
        }
      end
      before do
        put "/movies/#{movie_id}", params: movie_attributes
        get "/movies/#{movie_id}"
      end

      it 'returns the audio qualities' do
        expect(json['title']).to eq('La venganza del conde de MonteCristo')
        expect(json['year']).to eq(1999)
        expect(json['audio_qualities'].first['id']).to eq(audio_quality_id)
      end
    end
  end

  # Test suite for DELETE /movies/:id
  describe 'DELETE /movies/:id' do
    before { delete "/movies/#{movie_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
