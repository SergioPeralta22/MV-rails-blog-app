class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def liked_by?(user)
    likes.where(user:).exists?
  end

  def recent_comments
    comments.limit(5).includes(:author).order(created_at: :desc)
  end

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
