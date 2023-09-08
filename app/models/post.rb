class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  attr_accessor :tag_ids

  def assign_tags
    if @tag_ids
      self.tags = Tag.where(id: @tag_ids)
    end
  end

end
