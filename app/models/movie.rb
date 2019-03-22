class Movie < ApplicationRecord
  validates :title, :year, presence: true
end
