class User < ApplicationRecord
    has_many :ratings

    validates :name, presence: :true
    validates :is_admin, inclusion: [true, false], exclusion: [nil]

    has_one_attached :profile_picture
end
