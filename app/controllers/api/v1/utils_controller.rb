class Api::V1::UtilsController < ApplicationController
  
  def subscribe
    email = params['subscribe']['email']

    sub = Subscribe.new(email: email)

    if sub.save
      render json: { status: 'ok', email: email }
    else
      render json: { status: 'duplicated', email: email }
    end
  end

  def cart

    #先找到商品
    # product = Product.friendly.find(params[:id])
    product = Product.joins(:skus).find_by(skus: {id: params[:sku]})  #find(params[:id]要改掉)


    if product 
      # cart = Cart.new 這邊這樣不是正確
      #cart = Cart.from_hash(session[:cart_9527])
      #上面用application裡的current_cart取代

      # current_cart.add_item(product.code)
      current_cart.add_sku(params[:sku])

      session[:cart_9527] = current_cart.serialize       #serialize可以把購物車物件序列化成一個hash,再存到session裡面

      render json: {status: 'ok', items:current_cart.items.count }
    end
  end
end
