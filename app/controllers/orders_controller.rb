class OrdersController < ApplicationController
    before_action :authenticate_user!           #要登入才能用,devise附加的功能

    def create
        @order = current_user.orders.build(order_params)

        current_cart.items.each do |item|
            @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)   #sku_id: item.sku_id
        end

        if @order.save
            redirect_to root_path, notice: 'OK'
        else
            render 'carts/checkout'
        end
    end

    private
    def order_params
        params.require(:order).permit(:recipient, :tel, :address, :note)
    end
end
