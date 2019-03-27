require 'rails_helper'

RSpec.describe GenresMovie, type: :model do
  it { is_expected.to validate_uniqueness_of(:genre_id).scoped_to(:movie_id) }
  it { is_expected.to belong_to(:genre) }
  it { is_expected.to belong_to(:movie) }

  it { is_expected.to have_attribute :genre_id }
  it { is_expected.to have_attribute :movie_id }
end
