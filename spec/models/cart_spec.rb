require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  #describe也可以換成context
  describe "基本功能" do        
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      # AAA三A原則 = Arrange安排,Act操作使用,Assert評估
      cart = Cart.new
      cart.add_item(2)   #2代表商品編號
      expect(cart.empty?).to be false  #expect預期
    end
  end 

  describe "進階功能" do
  end 

end
