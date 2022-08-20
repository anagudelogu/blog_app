class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_create { update_likes_counter(:increment) }
  after_destroy { update_likes_counter(:decrement) }

  def update_likes_counter(action)
    action == :increment ? post.increment!(:likescounter) : post.decrement!(:likescounter)
  end
end
