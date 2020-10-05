class Item < ApplicationRecord
	attachment :image
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
end
