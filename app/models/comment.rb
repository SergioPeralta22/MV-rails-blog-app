class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_comments_counter

  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
