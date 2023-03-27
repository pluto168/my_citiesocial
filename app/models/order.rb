class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items

  #驗證欄位
  validates :recipient, :tel, :address, presence: true

  #自動產生訂單編號,只會在新訂單時建立
  before_create :generate_order_num

  private
  def generate_order_num
    self.order = SecureRandom.hex(5) unless num    #10個16進位
  end
  
end
