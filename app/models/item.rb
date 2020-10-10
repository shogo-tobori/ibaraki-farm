class Item < ApplicationRecord
	attachment :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :shipping_time, presence: true
  validates :image, presence: true

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :genre
end
