class Movie < ApplicationRecord
  validates :title, :year, presence: true

  has_many :video_qualities_movies, dependent: :destroy
  has_many :video_qualities, through: :video_qualities_movies

  def as_json(*)
    super.merge(video_qualities: video_qualities)
  end
end
