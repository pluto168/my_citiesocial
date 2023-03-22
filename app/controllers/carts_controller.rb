class CartsController < ApplicationController
    before_action :authenticate_user!           #要登入才能用,devise附加的功能

    def show
        
    end
end
