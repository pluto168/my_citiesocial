require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  #不用寫@cart.new
  let(:cart) { Cart.new  } 

  #describe也可以換成context
  context "基本功能" do    
    
    #寫法比較麻煩
    # before(:each) do
    #   @cart = Cart.new
    # end

    #不用寫@cart.new
    # let(:cart) { Cart.new  }  #移動到最上層
    
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      # AAA三A原則 = Arrange安排,Act操作使用,Assert評估
      # cart = Cart.new
      cart.add_sku(2)   #2代表商品編號    #add_item全部換成add_sku
      # expect(cart.empty?).to be false  #expect,購物車的empty是不是false
      expect(cart).not_to be_empty   #expect預期不是空的
    end

    it "如果加了相同種類的商品到購物車裡，購買項目(CartItem)並不會增加，但商品的數量會改變。" do
      # cart = Cart.new
      3.times {cart.add_sku(1)}   #加3次購物車
      2.times {cart.add_sku(2)}
      
      expect(cart.items.count).to be 2    #測試車子的數量是不是對的
      expect(cart.items.first.quantity).to be 3     #測試數量是不是3
      # expect(cart.items.last.quantity).to be 2
    end

    it "商品可以放到購物車裡，也可以再拿出來。" do
      #1A,購物車想new出來
      # cart = Cart.new

      # v1 =  Vendor.create(title: 'v1')
      # p1 =  Product.create(name: 'kk', list_price: '10', sell_price: '5', vendor: v1)
      #p1 = FactoryBot.create(:product)
      p1 = create(:product, :with_skus)

      #2A,把操作,把東西丟到購物車
      # cart.add_sku(p1.id)
      cart.add_sku(p1.skus.first.id)


      #3A,評估,東西放進去再拿出來後,是不是原物
      expect(cart.items.first.product).to be_a Product
    end

    it "可以計算整台購物車的總消費金額" do
      # cart = Cart.new

      p1 = create(:product, :with_skus, sell_price: 5)
      p2 = create(:product, :with_skus, sell_price: 10)

      3.times { cart.add_sku(p1.skus.first.id)}
      2.times { cart.add_sku(p2.skus.first.id)}

      expect(cart.total_price).to eq 35
    end
  end 

  context "進階功能" do
    #不用寫@cart.new
    # let(:cart) { Cart.new  } #移動到最上層

    it "可以將購物車內容轉換成 Hash 並存到 Session 裡" do
      #1A
      # cart = Cart.new

      p1 = create(:product, :with_skus)
      p2 = create(:product, :with_skus)
      

      3.times { cart.add_sku(p1.id)}
      2.times { cart.add_sku(p2.id)}

      expect(cart.serialize).to eq cart_hash
    end

    it "也可以存放在 Session 的內容 (Hash 格式），還原成購物車的內容" do
      cart = Cart.from_hash(cart_hash)

      expect(cart.items.first.quantity).to be 3
    end

    private
    def cart_hash
      {
        "items" => [
          {"sku_id" => 1, "quantity" => 3},
          {"sku_id" => 2, "quantity" => 2},
        ]
      }
    end
  end
end
