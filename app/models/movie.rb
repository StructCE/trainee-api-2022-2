class Movie < ApplicationRecord
  belongs_to :genre

  validates :name, :genre, presence: :true
  validates :name, uniqueness: :true
end
