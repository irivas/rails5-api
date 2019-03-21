require 'rails_helper'

RSpec.describe AudioQuality, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:abbr) }

  it { is_expected.to have_attribute :name }
  it { is_expected.to have_attribute :abbr }
  it { is_expected.to have_attribute :position }
  it { is_expected.to have_attribute :default }
end
