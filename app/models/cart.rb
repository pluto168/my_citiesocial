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
end