class User < ApplicationRecord
    has_many :movies, through: :reviews
end
