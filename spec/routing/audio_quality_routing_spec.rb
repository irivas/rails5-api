require 'rails_helper'

RSpec.describe 'Audio qualities routing', type: :routing do
  describe 'GET /audio_qualities' do
    it 'routes to audio_qualities#index' do
      expect(get: '/audio_qualities')
        .to route_to(controller: 'audio_qualities', action: 'index')
    end
  end

  describe 'GET /audio_qualities/:id' do
    it 'routes to audio_qualities#show' do
      expect(get: '/audio_qualities/1')
      .to route_to(controller: 'audio_qualities', action: 'show', id: '1')
    end
  end

  describe 'PUT /audio_qualities/:id' do
    it 'routes to audio_qualities#update' do
      expect(put: '/audio_qualities/1')
      .to route_to(controller: 'audio_qualities', action: 'update', id: '1')
    end
  end

  describe 'POST /audio_qualities' do
    it 'routes to audio_qualities#create' do
      expect(post: '/audio_qualities')
      .to route_to(controller: 'audio_qualities', action: 'create')
    end
  end

  describe 'DELETE /audio_qualities/:id' do
    it 'routes to audio_qualities#destroy' do
      expect(delete: '/audio_qualities/1')
      .to route_to(controller: 'audio_qualities', action: 'destroy', id: '1')
    end
  end
end
