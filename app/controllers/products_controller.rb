class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create,:get_category_children,:get_category_grandchildren]
  before_action :move_to_index, except: [:index, :show]
  before_action :refuse_to_edit, only: :edit
  before_action :set_category, only: [:new, :create, :edit, :update]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
    @product = Product.new
    @product.images.new
    3.times{@product.images.build}
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
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
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
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

  def destroy
    if current_user.id == @product.seller_id && @product.destroy
      redirect_to root_path, alert: "商品を削除しました"
    else
      render :show, alert: "商品削除に失敗しました"
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :content, :bland_name, :price, :prefecture_id, :product_status_id, :delively_days_id , :delively_cost_id, :category_id, :delively_method_id, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end

  def refuse_to_edit
    if current_user.id != @product.seller_id
      redirect_to root_path
    end
  end 

  def set_category
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end
  
end
