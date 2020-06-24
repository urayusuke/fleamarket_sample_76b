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
|delively_method_id|integer|null: false|

### Association
- belongs_to :category
- belongs_to_active_hash :product_status
- belongs_to_active_hash :delively_cost
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delively_days
- belongs_to_active_hash :delively_method

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
|src|string|null: false|

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
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## ⑦commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
|text|string||

### Association
- belongs_to :user
- belongs_to :product

# 担当機能

## トップページの実装
[![Image from Gyazo](https://i.gyazo.com/569a524331f2592d1792fa98085df86d.jpg)](https://gyazo.com/569a524331f2592d1792fa98085df86d)
[![Image from Gyazo](https://i.gyazo.com/a1988a94036349d7a243ee6ac2753111.jpg)](https://gyazo.com/a1988a94036349d7a243ee6ac2753111)
[![Image from Gyazo](https://i.gyazo.com/e537800bf8b623f7e371e1f709ded4cf.jpg)](https://gyazo.com/e537800bf8b623f7e371e1f709ded4cf)
[![Image from Gyazo](https://i.gyazo.com/44cae5be4d413958aa55b6a112bc30e2.png)](https://gyazo.com/44cae5be4d413958aa55b6a112bc30e2)
[![Image from Gyazo](https://i.gyazo.com/803599262b4c58d673a5fc6bb937006d.jpg)](https://gyazo.com/803599262b4c58d673a5fc6bb937006d)
[![Image from Gyazo](https://i.gyazo.com/206e9e16edc07de1d61254ba8361bbb8.png)](https://gyazo.com/206e9e16edc07de1d61254ba8361bbb8)

## トップページの商品一覧表示 
[![Image from Gyazo](https://i.gyazo.com/c196eb9c67659827343cfd33e6e9975e.jpg)](https://gyazo.com/c196eb9c67659827343cfd33e6e9975e)

## カテゴリー機能のJS実装
[![Image from Gyazo](https://i.gyazo.com/4468012e9091ae682cda40cd962e935c.gif)](https://gyazo.com/4468012e9091ae682cda40cd962e935c)
[![Image from Gyazo](https://i.gyazo.com/a29d02a947e51fa4c6987eea16037dfc.gif)](https://gyazo.com/a29d02a947e51fa4c6987eea16037dfc)

## 出品機能の画像表示、削除
[![Image from Gyazo](https://i.gyazo.com/102a2c721800df175c69cd66bb0121f8.gif)](https://gyazo.com/102a2c721800df175c69cd66bb0121f8)
[![Image from Gyazo](https://i.gyazo.com/183e2365119448b3b6ddd2d087e7b09c.gif)](https://gyazo.com/183e2365119448b3b6ddd2d087e7b09c)

## 商品情報編集の画像編集
[![Image from Gyazo](https://i.gyazo.com/ff2a22b4f7f59a926e95fe9caee75649.gif)](https://gyazo.com/ff2a22b4f7f59a926e95fe9caee75649)

