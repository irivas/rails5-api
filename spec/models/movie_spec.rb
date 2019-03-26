require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { is_expected.to have_attribute :title }
  it { is_expected.to have_attribute :year }
  it { is_expected.to have_attribute :plot }
  it { is_expected.to have_attribute :duration }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:year) }

  it { is_expected.to have_many(:audio_qualities) }

  it { is_expected.to respond_to(:as_json) }

  describe '#as_json' do
    let(:movie) do
      build(
        :movie,
        title: 'X-Men', year: 2019, plot: 'Movie plot', duration: 120
      )
    end
    let(:movie_json) do
      {
        id: nil,
        title: 'X-Men',
        year: 2019,
        plot: 'Movie plot',
        duration: 120,
        audio_qualities: []
      }.to_json
    end

    it 'returns model as json' do
      expect(movie.to_json).to eq(movie_json)
    end
  end
end
