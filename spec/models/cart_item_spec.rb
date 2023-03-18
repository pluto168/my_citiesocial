require 'rails_helper'

RSpec.describe CartItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "每個 Cart Item 都可以計算它自己的金額（小計）" do
      #1A
      cart = Cart.new

      #2A spec/rails_helper.rb有config.include FactoryBot::Syntax::Methods,所以不用寫FactoryBot.create
      p1 = create(:product, sell_price: 5)
      p2 = create(:product, sell_price: 10)

      3.times { cart.add_item(p1.id)}
      2.times { cart.add_item(p2.id)}

      #3A
      expect(cart.items.first.total_price).to eq 15     #be:比較內容物型態是否一樣int ...    eq:比較物件記憶體位置
      expect(cart.items.last.total_price).to eq 20

  end
end
