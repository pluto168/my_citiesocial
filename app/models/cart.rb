#PORO = Plain Old Ruby Object

class Cart
    attr_reader :items

    def initialize(items = [])
        # @items = []
        @items = items
    end

    def add_sku(sku_id)             #add_item換成add_sku,rpoduct_id換成sku_id
        #查詢是否存在,沒找到才增新
        found = @items.find { |item| item.sku_id == sku_id }

        if found
            found.increment!
        else
            # @items << sku_id    # <<是把sku_id丟到陣列@items
            @items << CartItem.new(sku_id)
        end
    end

    def empty?
        @items.empty?        #陣列@items是否為空?
    end

    # def items               #attr_reader :items就可以寫出這3行   
    #     return @items 
    # end

    def total_price
        # total = 0
        
        # @items.each do |item|
        #     total += item.total_price
        # end

        # total

        @items.reduce(0) { |sum, item| sum + item.total_price }
    end

    #進階功能
    def serialize

        #寫死code
        # items = [
        #     {"sku_id" => 1, "quantity" => 3},
        #     {"sku_id" => 2, "quantity" => 2},
        # ]

        #可輸入code
        items = @items.map { |item| {   "sku_id" => item.sku_id, 
                                        "quantity" => item.quantity     }}

        { "items" => items}
        
    end

    def self.from_hash(hash = nil)
        # {
        #     "items" => [
        #       {"sku_id" => 1, "quantity" => 3},
        #       {"sku_id" => 2, "quantity" => 2},
        #     ]
        #   }
        if hash && hash["items"]
            #map蒐集成一個新的陣列
            items = hash["items"].map { |item|
                CartItem.new(item["sku_id"], item["quantity"])
            }
            # p items

            Cart.new(items)
        else
            Cart.new
        end
    end 
end