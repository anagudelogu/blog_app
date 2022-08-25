class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 4..250 }
  validates :commentscounter, comparison: { greater_than_or_equal_to: 0 }
  validates :likescounter, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create { update_post_counter(:increment) }
  after_destroy { update_post_counter(:decrement) }

  def update_post_counter(action)
    action == :increment ? author.increment!(:postscounter) : author.decrement!(:postscounter)
  end

  def most_recent_comments
    comments.order(id: :desc).limit(5)
  end
end
