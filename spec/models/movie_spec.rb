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
end
