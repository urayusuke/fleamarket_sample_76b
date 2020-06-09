class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end
  def new
    @product = Product.new
    @product.images.new
    # 3.times{@product.images.build}
  end
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end
  def purchase
  end
  private
  def product_params
    params.require(:product).permit(:name, :content, :price, images_attributes: [:name]).merge(user_id: current_user.id)
  end
end