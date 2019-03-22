class VideoQuality < ApplicationRecord
  validates :name, :abbr, presence: true
end
