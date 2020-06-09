class Product < ApplicationRecord

# Association
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delively_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delively_days
  
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :images

# validation
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, length: { maximum: 40 }, presence: true
  validates :content, length: { maximum: 1000 }, presence: true
  validates :price, numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }, presence: true

end
