class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  # Follow associations
  # Users that this user is following
  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  
  # Users that are following this user
  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  # Helper methods
  def follow(user)
    following << user unless following.include?(user)
  end
  
  def unfollow(user)
    following.delete(user)
  end
  
  def following?(user)
    following.include?(user)
  end
end
