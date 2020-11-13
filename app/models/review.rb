class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    has_many :likes

    validates :content, presence: true
    validates :content, length: {in: 4..500}

    def liked?
        !!self.likes.find{|like| like.user_id == user.id}
    end
end
