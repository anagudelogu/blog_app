class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :name, presence: true
  validates :postscounter, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments
  has_many :posts
  has_many :likes

  def most_recent_posts
    posts.includes(:author).order(id: :desc).limit(3)
  end
end
