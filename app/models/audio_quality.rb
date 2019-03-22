class AudioQuality < ApplicationRecord
  validates :name, :abbr, presence: true
end
