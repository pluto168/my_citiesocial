class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items

  #驗證欄位
  validates :recipient, :tel, :address, presence: true

  #自動產生訂單編號,只會在新訂單時建立
  before_create :generate_order_num

  #AASM選擇機
  include AASM

  aasm column: 'state' do                             #aasm要更改成schem裡orders的欄位state,要加column
    state :pending, initial: true
    state :paid, :delivered, :cancelled               #已付款,已出貨,已取消訂單
    
    event :pay do
      transitions from: :pending, to: :paid           #從閒置中到已付款

      before do |args|                                   # 在pay之前動作,呼應1. 變更 order 狀態的order.pay!
        self.transation_id = args[:transation_id]      #transaction_id,paid_at都是schema裏order欄位
        self.paid_at = Time.now
      end
    end

    event :deliver do
      transitions from: :paid, to: :delivered           #已付款到已出貨
    end

    event :cancel do
      transitions from: [:pending, :paid, :delivered], to: :cancelled
    end
  end


  private
  def generate_order_num
    self.num = SecureRandom.hex(5) unless num #10個16進位
  end
  
end
