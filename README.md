# フリマアプリ_DB設計 (76期/チームB) 


## ①usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_one :address
- has_one :credit

- has_many :selling_products, -> { where("buyer_id is NULL") },class_name: 'Product', foreign_key: 'seller_id'
- has_many :sold_out_products, -> { where("buyer_id is not NULL") },class_name: 'Product', foreign_key: 'seller_id'


### index
- add_index :users, :email,unique: true

## ②productsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|name|string|null: false|
|content|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|bland_name|string||
|price|integer|null: false|
|product_status_id|integer|null: false|
|delively_cost_id|integer|null: false|
|prefecture_id|integer|null: false|
|delively_days_id|integer|null: false|

### Association
- belongs_to :category
- belongs_to_active_hash :product_status
- belongs_to_active_hash :delively_cost
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delively_days

- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :buyer, class_name: 'User', optional: true, foreign_key: 'buyer_id'

- has_many :images


## ③categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_ancestry
- has_many :products

### index
- add_index :categories, :ancestry

## ④imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|name|string|null: false|

### Association
- belongs_to :product

## ⑤addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|delively_last_name|string|null: false|
|delively_first_name|string|null: false|
|delively_last_name_kana|string|null: false|
|delively_first_name_kana|string|null: false|
|postcode|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## ⑥creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|code|string|null: false|

### Association
- belongs_to :user

