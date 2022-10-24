class Movie < ApplicationRecord
  belongs_to :genre
  has_many :ratings

  validates :name, :genre, presence: :true
  validates :name, uniqueness: :true

  has_many_attached :images
end
