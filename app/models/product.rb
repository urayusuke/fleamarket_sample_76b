class Product < ApplicationRecord

# Association
  belongs_to :category

    #『売り手』情報
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
    #『買い手』情報
  belongs_to :buyer, class_name: 'User', optional: true, foreign_key: 'buyer_id'
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delively_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delively_days

  has_many :images

# validation

end
