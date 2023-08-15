class User < ApplicationRecord
  has_many :comments, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :user_id

  def recent_posts
    posts.limit(5).order(created_at: :desc)
  end
end