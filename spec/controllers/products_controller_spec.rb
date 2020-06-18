require 'rails_helper'

describe ProductsController do

  describe '#index' do

    it '@productsに正しい値が入っていること' do
      products = build_list(:product, 3)
      get :index
    end
  end

  describe '#new' do

    it 'new.html.hamlに遷移すること' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#edit' do
    
    it 'edit.html.hamlに遷移すること' do
      product = build(:product)
      get :edit, params: { id: product } 
      expect(response).to render_template :edit
    end
  end
end
