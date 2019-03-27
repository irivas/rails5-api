class Movie < ApplicationRecord
  validates :title, :year, presence: true

  has_many :audio_qualities_movies, dependent: :destroy
  has_many :audio_qualities, through: :audio_qualities_movies
  has_many :video_qualities_movies, dependent: :destroy
  has_many :video_qualities, through: :video_qualities_movies

  def as_json(*)
    super.merge(audio_qualities: audio_qualities, video_qualities: video_qualities)
  end
end
