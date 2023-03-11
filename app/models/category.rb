class Category < ApplicationRecord
  has_many :products

  #paranoia軟刪除
  acts_as_paranoid

  #驗證
  validates :name, presence: true

  #商品分類
  acts_as_list
  
end
