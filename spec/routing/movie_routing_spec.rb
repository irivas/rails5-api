require 'rails_helper'

RSpec.describe 'Movies routing', type: :routing do
  describe 'GET /movies' do
    it 'routes to movies#index' do
      expect(get: '/movies')
        .to route_to(controller: 'movies', action: 'index')
    end
  end

  describe 'GET /movies/:id' do
    it 'routes to movies#show' do
      expect(get: '/movies/1')
      .to route_to(controller: 'movies', action: 'show', id: '1')
    end
  end

  describe 'PUT /movies/:id' do
    it 'routes to movies#update' do
      expect(put: '/movies/1')
      .to route_to(controller: 'movies', action: 'update', id: '1')
    end
  end

  describe 'POST /movies' do
    it 'routes to movies#create' do
      expect(post: '/movies')
      .to route_to(controller: 'movies', action: 'create')
    end
  end

  describe 'DELETE /movies/:id' do
    it 'routes to movies#destroy' do
      expect(delete: '/movies/1')
      .to route_to(controller: 'movies', action: 'destroy', id: '1')
    end
  end
end
