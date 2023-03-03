class Astroser::ProductsController < Astroser::BaseController
  
  def index
  end

  def new
    @product=Product.new
  end

end
