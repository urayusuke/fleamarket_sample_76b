class Credit < ApplicationRecord

  # Association
  belongs_to :user

  # validation
  with_options presence: true do
    validates :user_id
    validates :card_id
    validates :customer_id
  end
end
