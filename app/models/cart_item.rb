#PORO = Plain Old Ruby Object

#需要商品編號,跟數量
class CartItem
    attr_reader :sku_id, :quantity

    def initialize(sku_id, quantity = 1)      #quantity預設值設1
        @sku_id = sku_id
        @quantity = quantity
    end

    def increment!(n = 1)
        @quantity += n
    end

    def product
        # Product.find_by(id: sku_id)     這樣app/views/carts/show.html.erb的product會抓不到
        # Product.friendly.find(product_id)    #改名後會找不到
        Product.joins(:skus).find_by(skus: { id: sku_id })
        # Sku.find(sku_id).product
    end

    def total_price
        product.sell_price * @quantity     #s商品 * 數量
    end
end

# CartItem.new(2,3)  #商品2號,數量3