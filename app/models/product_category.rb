class ProductCategory < ApplicationRecord

  # Association
  belongs_to :product
  belongs_to :category

  # validation
end
