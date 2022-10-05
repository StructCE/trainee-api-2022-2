class User < ApplicationRecord
    has_many :ratings

    validates :name, presence: :true
    validates :is_admin, inclusion: [true, false], exclusion: [nil]
end
