require 'rails_helper'

describe Product do
  describe '#create' do
    it "商品名が空欄だと出品できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "商品の説明が空欄だと出品できないこと" do
      product = build(:product, content: nil)
      product.valid?
      expect(product.errors[:content]).to include("can't be blank")
    end

    it "カテゴリーを選択しないと出品できないこと" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include()
    end

    it "商品の状態を選択しないと出品できないこと" do
      product = build(:product, product_status_id: nil)
      product.valid?
      expect(product.errors[:product_status_id]).to include()
    end

    it "配送料の負担を選択しないと出品できないこと" do
      product = build(:product, delively_cost_id: nil)
      product.valid?
      expect(product.errors[:delivery_cost_id]).to include()
    end

    it "配送の方法を選択しないと出品できないこと" do
      product = build(:product, delively_method_id: nil)
      product.valid?
      expect(product.errors[:delively_method_id]).to include()
    end

    it "発送元の地域を選択しないと出品できないこと" do
      product = build(:product, prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture_id]).to include ("can't be blank")
    end

    it "発送までの日数を選択しないと出品できないこと" do
      product = build(:product, delively_days_id: nil)
      product.valid?
      expect(product.errors[:delively_days_id]).to include()
    end

    it "販売価格を入力しないと出品できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include ("can't be blank")
    end

    it "全て入力していると出品できること" do
      product = build(:product)
      expect(product).to be_valid
    end
  end
end