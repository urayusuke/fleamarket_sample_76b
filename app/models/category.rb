class Category < ApplicationRecord

  # Association
  has_many :product_categories
  has_many :products, through: :product_categories

  # validation
end
