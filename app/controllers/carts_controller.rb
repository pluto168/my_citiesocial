class CartsController < ApplicationController
    before_action :authenticate_user!           #要登入才能用,devise附加的功能

    def show
        
    end

    def destroy
        session[:cart_9527] = nil
        redirect_to root_path, notice: '購物車已清空'
    end

    def checkout
    
    end
end
