class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  # ユーザーがフォローしている人の関係
  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followees, through: :active_follows, source: :followee

  # ユーザーのフォロワーの関係
  has_many :passive_follows, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  def active_for_authentication?
   super && !is_deleted
  end

  def inactive_message
    is_deleted ? :deleted_account : super
  end
  #退会処理を行っている場合、ログインできなくする

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
