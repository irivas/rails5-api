class VideoQualitiesMovie < ApplicationRecord
  belongs_to :video_quality
  belongs_to :movie

  validates :video_quality_id, uniqueness: { scope: :movie_id }
end
