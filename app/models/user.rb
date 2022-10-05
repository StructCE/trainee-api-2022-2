class User < ApplicationRecord
    validates :name, presence: :true

    validates :is_admin, inclusion: [true, false], exclusion: [nil]
end
