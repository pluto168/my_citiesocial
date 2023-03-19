#PORO = Plain Old Ruby Object

class Cart
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(product_id)
        #查詢是否存在,沒找到才增新
        found = @items.find { |item| item.product_id == product_id }

        if found
            found.increment!
        else
            # @items << product_id    # <<是把product_id丟到陣列@items
            @items << CartItem.new(product_id)
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
        #     {"product_id" => 1, "quantity" => 3},
        #     {"product_id" => 2, "quantity" => 2},
        # ]

        #可輸入code
        items = @items.map { |item| {   "product_id" => item.product_id, 
                                        "quantity" => item.quantity     }

        }

        { "items" => items}
        
    end
end