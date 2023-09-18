class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

end
