require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  #describe也可以換成context
  context "基本功能" do        
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      # AAA三A原則 = Arrange安排,Act操作使用,Assert評估
      cart = Cart.new
      cart.add_item(2)   #2代表商品編號
      expect(cart.empty?).to be false  #expect預期
    end

    it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變。" do
      cart = Cart.new
      3.times {cart.add_item(1)}   #加3次購物車
      2.times {cart.add_item(2)}
      expect(cart.items.count).to be 2    #測試車子的數量是不是對的
      expect(cart.items.first.quantity).to be 3     #測試數量是不是3
      # expect(cart.items.last.quantity).to be 2
    end
  end 

  context "進階功能" do
  end
end
