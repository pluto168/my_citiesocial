class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items

  #驗證欄位
  validates :recipient, :tel, :address, presence: true
  
end
