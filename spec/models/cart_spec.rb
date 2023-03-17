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

    it "商品可以放到購物車裡，也可以再拿出來。" do
      #1A,購物車想new出來
      cart = Cart.new

      
      v1 =  Vendor.create(title: 'v1')
      p1 =  Product.create(name: 'kk', list_price: '10', sell_price: '5', vendor: v1)

      #2A,把操作,把東西丟到購物車
      cart.add_item(p1.id)

      #3A,評估,東西放進去再拿出來後,是不是原物
      expect(cart.items.first.product).to be_a Product
    end
  end 

  context "進階功能" do
  end
end
