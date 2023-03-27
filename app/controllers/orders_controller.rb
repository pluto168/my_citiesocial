class OrdersController < ApplicationController
    before_action :authenticate_user!           #要登入才能用,devise附加的功能

    def create
        @order = current_user.orders.build(order_params)

        current_cart.items.each do |item|
            @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)   #sku_id: item.sku_id
        end

        #當訂單建立成功後
        if @order.save
            #打api
            resp = Faraday.post("#{ENV['line_pay_endpoint']}/v2/payments/request") do |req|
                req.headers['Content-Type'] = 'application/json'
                req.headers['X-LINE-ChannelId'] = ENV['line_pay_channel_id']
                req.headers['X-LINE-ChannelSecret'] = ENV['line_pay_channel_secret_key']
                req.body = {
                        "productName": "3C購物中心",
                        "amount": current_cart.total_price.to_i,
                        "currency": "TWD",
                        "confirmUrl": "http://localhost:3000/orders/confirmed",
                        "orderId": @order.num
                }.to_json
            end

            result = JSON.parse(resp.body)     #用JSON.parse去解析,回來的這包body

            if result["returnCode"]  == "0000"
                payment_url = result["info"]["paymentUrl"]["web"]
                redirect_to payment_url
            else
                flash[:notice] = "付款發生錯誤"
                render 'carts/checkout'
            end
        end
    end

    private
    def order_params
        params.require(:order).permit(:recipient, :tel, :address, :note)
    end
end