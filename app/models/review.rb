class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie

    validates :content, presence: true
    validates :content, length: {in: 4..500}
end
