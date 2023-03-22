#PORO = Plain Old Ruby Object

#需要商品編號,跟數量
class CartItem
    attr_reader :product_id, :quantity

    def initialize(product_id, quantity = 1)      #quantity預設值設1
        @product_id =product_id
        @quantity = quantity
    end

    def increment!(n = 1)
        @quantity += n
    end

    def product
        # Product.find_by(id: product_id)     這樣app/views/carts/show.html.erb的product會抓不到
        Product.friendly.find(product_id)

    end

    def total_price
        product.sell_price * @quantity     #s商品 * 數量
    end
end

# CartItem.new(2,3)  #商品2號,數量3