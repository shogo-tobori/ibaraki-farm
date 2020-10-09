class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum is_deleted: { 有効: false, 退会済み: true }

  def active_for_authentication?
    super && (self.is_deleted === "有効")
  end

end
