class Product < ApplicationRecord

# Association
  belongs_to :user
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delively_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delively_days

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :images

# validation

end
