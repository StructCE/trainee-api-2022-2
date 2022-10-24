class Movie < ApplicationRecord
  belongs_to :genre
  has_many :ratings

  validates :name, :genre, presence: :true
  validates :name, uniqueness: :true
end
