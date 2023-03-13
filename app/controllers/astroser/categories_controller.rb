class Astroser::CategoriesController < Astroser::BaseController
  before_action :find_category, only: [:edit, :update, :destroy]
  
  def index
    @category = Category.all.order(position: :asc)       #all可以省略
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to astroser_categories_path, notice: '分類新增成功'
    else
      render :new
    end
  end

  def edit
    #@category=Product.find(params[:id])
  end

  def update
    if @category.update(category_params)
      redirect_to astroser_categories_path, notice: '分類已更新'
    else
      render :edit
    end
  end

  def destroy
    #@category=Product.find(params[:id])
    @category.destroy
    redirect_to astroser_categories_path, notice: '分類已刪除'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category=Category.find(params[:id])
  end
end
