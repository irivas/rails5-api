require 'rails_helper'

RSpec.describe VideoQuality, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:abbr) }

  it { is_expected.to have_attribute :name }
  it { is_expected.to have_attribute :abbr }
  it { is_expected.to have_attribute :position }
  it { is_expected.to have_attribute :default }
end
