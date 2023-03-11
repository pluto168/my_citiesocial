class Category < ApplicationRecord
  has_many :products

  #paranoia軟刪除
  acts_as_paranoid

  #驗證
  validates :name, presence: true

  

end
