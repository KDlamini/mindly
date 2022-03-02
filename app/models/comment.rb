class Comment < ApplicationRecord
  after_save :update_comments_counter
  after_destroy :delete_comments_counter
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def delete_comments_counter
    post.decrement!(:comments_counter)
  end
end
