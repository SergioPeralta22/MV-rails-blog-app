class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes


  def liked_by?(user)
    likes.where(user:).exists?
  end

  private

  def comments_count=(value)
    self[:comments_count] = value
  end

  def likes_count=(value)
    self[:likes_count] = value
  end

  def update_likes_count
    self.likes_count = likes.count
  end

  def update_comments_count
    self.comments_count = comments.count
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
