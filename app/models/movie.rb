class Movie < ApplicationRecord
    belongs_to :director
    has_many :actors, though: :role
end
