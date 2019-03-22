class Movie < ApplicationRecord
  validates_presence_of :title, :year
end
