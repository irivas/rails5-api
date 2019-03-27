class GenresMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :genre

  validates :genre_id, uniqueness: { scope: :movie_id }
end
