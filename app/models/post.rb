class Post < ApplicationRecord
    after_save :update_posts_counter
    has_many :comments
    has_many :likes
    belongs_to :author, class_name: 'User'

    validates :title, presence: true, length: { minimum: 5 }

    def update_posts_counter
        author.increment!(:posts_counter)
    end
    
    def most_recent_comments
    comments.order('created_at DESC').limit(5)
    end
end
