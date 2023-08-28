class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :followings, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers_relationships, class_name: 'Follow', foreign_key: 'followee_id', dependent: :destroy
  # ユーザーがフォローしている人

  has_many :followees, through: :followings, source: :followee
  has_many :followers, through: :followers_relationships, source: :follower
  #ユーザーのフォロワー

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
