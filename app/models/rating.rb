class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :comment, presence: :true
  validates :grade, inclusion: [true, false], exclusion: [nil]
end
