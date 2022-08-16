class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_create :update_likes_counter

  def update_likes_counter
    post.update(likescounter: post.likescounter + 1)
  end
end
