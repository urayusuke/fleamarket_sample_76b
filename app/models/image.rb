class Image < ApplicationRecord
  # Association
  mount_uploader :src, ImageUploader
  belongs_to :product
  # validation
end