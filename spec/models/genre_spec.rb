require 'rails_helper'

RSpec.describe Genre, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_attribute :name }
end
