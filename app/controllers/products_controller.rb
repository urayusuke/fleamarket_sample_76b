class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create,:get_category_children,:get_category_grandchildren]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
    3.times{@product.images.build}
    @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    @user = User.find_by(id: @product.seller_id)
    @image = Image.find_by(product_id: @product.id)
    @images = Image.where(product_id: @product.id)
  end

  def edit
    if @product.images.count == 1
      @product.images.new
      2.times{@product.images.build}
    end
    if @product.images.count == 2
      @product.images.new
      1.times{@product.images.build}
    end
    if @product.images.count == 3
      @product.images.new
    end

    grandchild_category = @product.category
    child_category = grandchild_category.parent

    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  

  private
  def product_params
    params.require(:product).permit(:name, :content, :bland_name, :price, :prefecture_id, :product_status_id, :delively_days_id , :delively_cost_id, :category_id, :delively_method_id, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
