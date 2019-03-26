require 'rails_helper'

RSpec.describe AudioQualitiesMovie, type: :model do
  it { is_expected.to validate_uniqueness_of(:audio_quality_id).scoped_to(:movie_id) }
  it { is_expected.to belong_to(:audio_quality) }
  it { is_expected.to belong_to(:movie) }

  it { is_expected.to have_attribute :audio_quality_id }
  it { is_expected.to have_attribute :movie_id }

end
