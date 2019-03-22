require 'rails_helper'

RSpec.describe 'Video qualities routing', type: :routing do
  describe 'GET /video_qualities' do
    it 'routes to video_qualities#index' do
      expect(get: '/video_qualities')
        .to route_to(controller: 'video_qualities', action: 'index')
    end
  end

  describe 'GET /video_qualities/:id' do
    it 'routes to video_qualities#show' do
      expect(get: '/video_qualities/1')
      .to route_to(controller: 'video_qualities', action: 'show', id: '1')
    end
  end

  describe 'PUT /video_qualities/:id' do
    it 'routes to video_qualities#update' do
      expect(put: '/video_qualities/1')
      .to route_to(controller: 'video_qualities', action: 'update', id: '1')
    end
  end

  describe 'POST /video_qualities' do
    it 'routes to video_qualities#create' do
      expect(post: '/video_qualities')
      .to route_to(controller: 'video_qualities', action: 'create')
    end
  end

  describe 'DELETE /video_qualities/:id' do
    it 'routes to video_qualities#destroy' do
      expect(delete: '/video_qualities/1')
      .to route_to(controller: 'video_qualities', action: 'destroy', id: '1')
    end
  end
end
