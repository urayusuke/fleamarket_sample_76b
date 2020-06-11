class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :edit, :create]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end
  def new
    @product = Product.new
    @product.images.new
    3.times{@product.images.build}
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  

  def purchase
  end

  private
  def product_params
    params.require(:product).permit(:name, :content, :bland_name, :price, :prefecture_id, :product_status_id, :delively_days_id , :delively_cost_id, :category_id, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
