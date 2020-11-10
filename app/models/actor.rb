class Actor < ApplicationRecord
    has_many :genres
    has_many :movies, though: :role
end
