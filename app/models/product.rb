class Product < ApplicationRecord

  # Association
  belongs_to :user

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :images

  # validation

end
