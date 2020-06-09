class Category < ApplicationRecord

  # Association
  has_ancestry
  has_many :products

  # validation
end
