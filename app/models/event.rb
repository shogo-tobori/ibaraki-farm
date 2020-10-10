class Event < ApplicationRecord

  validates :title, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :explanation, presence: true

end
