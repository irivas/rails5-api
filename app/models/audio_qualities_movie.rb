class AudioQualitiesMovie < ApplicationRecord
  belongs_to :audio_quality
  belongs_to :movie

  validates :audio_quality_id, uniqueness: { scope: :movie_id }
end
