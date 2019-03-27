class Movie < ApplicationRecord
  validates :title, :year, presence: true

  has_many :audio_qualities_movies, dependent: :destroy
  has_many :audio_qualities, through: :audio_qualities_movies

  has_many :video_qualities_movies, dependent: :destroy
  has_many :video_qualities, through: :video_qualities_movies

  has_many :genres_movies, dependent: :destroy
  has_many :genres, through: :genres_movies

  def as_json(*)
    super.merge(
      audio_qualities: audio_qualities,
      video_qualities: video_qualities,
      genres: genres
    )
  end
end
