#PORO = Plain Old Ruby Object

class Cart
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(product_id)
        @items << product_id    # <<是把product_id丟到陣列@items
    end

    def empty?
        @items.empty?        #陣列@items是否為空?
    end

    # def items               #attr_reader :items就可以寫出這3行   
    #     return @items 
    # end
end