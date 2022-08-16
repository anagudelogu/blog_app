class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_create :update_comments_counter

  def update_comments_counter
    post.update(commentscounter: post.commentscounter + 1)
  end
end
