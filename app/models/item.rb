class Item < ApplicationRecord
	attachment :image

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :genre
end
