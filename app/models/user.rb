class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_one :address
  has_one :credit

    #出品中
  has_many :selling_products, -> { where("buyer_id is NULL") },class_name: 'Product', foreign_key: 'seller_id'
    #売却済
  has_many :sold_out_products, -> { where("buyer_id is not NULL") },class_name: 'Product', foreign_key: 'seller_id'
  
  has_many :comments
  
  # validation 
  validates :nickname, presence: true, length: {maximum: 15}
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday 
  end
end
