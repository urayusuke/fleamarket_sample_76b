class Product < ApplicationRecord

# Association
  belongs_to :category , optional: true

    #『売り手』情報
  belongs_to :seller, class_name: 'User', optional: true, foreign_key: 'seller_id'
    #『買い手』情報
  belongs_to :buyer, class_name: 'User', optional: true, foreign_key: 'buyer_id'
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delively_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delively_days
  belongs_to_active_hash :delively_method

  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy

  # validation
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, length: { maximum: 40 }, presence: true
  validates :content, length: { maximum: 1000 }, presence: true
  validates :price, numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }, presence: true
  validates :category_id, :product_status_id, :delively_cost_id, :delively_method_id, :prefecture_id, :delively_days_id, presence: true

  # 前後のレコードを取得するメソッド
  def previous
    Product.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Product.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

end
