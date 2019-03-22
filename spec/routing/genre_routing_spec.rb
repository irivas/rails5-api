require 'rails_helper'

RSpec.describe 'Genres routing', type: :routing do
  describe 'GET /genres' do
    it 'routes to genres#index' do
      expect(get: '/genres')
        .to route_to(controller: 'genres', action: 'index')
    end
  end

  describe 'GET /genres/:id' do
    it 'routes to genres#show' do
      expect(get: '/genres/1')
      .to route_to(controller: 'genres', action: 'show', id: '1')
    end
  end

  describe 'PUT /genres/:id' do
    it 'routes to genres#update' do
      expect(put: '/genres/1')
      .to route_to(controller: 'genres', action: 'update', id: '1')
    end
  end

  describe 'POST /genres' do
    it 'routes to genres#create' do
      expect(post: '/genres')
      .to route_to(controller: 'genres', action: 'create')
    end
  end

  describe 'DELETE /genres/:id' do
    it 'routes to genres#destroy' do
      expect(delete: '/genres/1')
      .to route_to(controller: 'genres', action: 'destroy', id: '1')
    end
  end
end
