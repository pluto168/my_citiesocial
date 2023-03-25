class OrdersController < ApplicationController
    before_action :authenticate_user!           #要登入才能用,devise附加的功能

    def create
        @order =current_user.orders.bild(order_params)

        current_cart.items.each do |item|
            @order.order_items.build(sku: 0, quantity: item.quantity)
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
