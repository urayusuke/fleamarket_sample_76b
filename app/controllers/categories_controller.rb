class CategoriesController < ApplicationController
  def index
    @ancestries = Category.all.order("ancestry ASC").order("id ASC").limit(13)
  end
end