class Address < ApplicationRecord

  # Association
  belongs_to :user, optional: true

  # validation
  validates :postcode, presence: true, length: {minimum: 7, maximum: 7}
  with_options presence: true do
    validates :delively_last_name
    validates :delively_first_name
    validates :delively_last_name_kana
    validates :delively_first_name_kana
    validates :prefecture
    validates :city
    validates :block
  end
end
