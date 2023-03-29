class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :sku

  #計算金額
  def total_price
    quantity * sku.product.sell_price
  end
end
