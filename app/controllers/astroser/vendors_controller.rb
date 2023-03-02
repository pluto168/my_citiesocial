class Astroser::VendorsController < Astroser::BaseController
  before_action :find_vendor, only: [:edit, :update, :destroy]

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def edit
    #@vendor = Vendor.find(params[:id]) #找到id
  end

  def update
    #@vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      redirect_to edit_astroser_vendor_path(@vendor), notice: '資料更新成功!'   #(@vendor)會停留在原地,先轉出再轉回
    else
      render :edit
    end
  end

  def destroy
    #@vendor = Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      redirect_to astroser_vendors_path, notice: '新增廠商成功!'
    else
      render :new
    end 
  end

  private
  def vendor_params
    params.require(:vendor).permit(:title, :description, :online)
  end

  def find_vendor
    @vendor = Vendor.find(params[:id])
  end
end
