class PostComment < ApplicationRecord

  validates :comment, presence: true

  belongs_to :item
  belongs_to :customer

end
