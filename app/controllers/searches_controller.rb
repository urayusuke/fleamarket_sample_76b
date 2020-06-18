class SearchesController < ApplicationController
  before_action :set_ransack, except: [:get_category_children, :get_category_grandchildren]

  def index
    @products = Product.search(params[:search]).limit(132)
    @search = params[:search]
    # @search_product = Product.ransack(params[:q]) 
    # @productes = @search_product.result
    # @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
  end

  def detail_search
    @search_product = Product.ransack(params[:q]) 
    @products = @search_product.result
    # @category_parent_array = Category.where(ancestry: nil).pluck(:name).unshift("選択して下さい")
  end

  # def get_category_children
  #   @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  # end

  # def get_category_grandchildren
  #   @category_grandchildren = Category.find("#{params[:child_id]}").children
  # end@

  private

  def set_ransack
    @q = Product.ransack(params[:q])
  end


end