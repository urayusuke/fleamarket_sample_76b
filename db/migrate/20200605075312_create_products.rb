class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user                   ,foreign_key: true,null: false

      t.string :name                       ,null: false
      t.string :content                    ,null: false
      t.string :bland_name         
      t.integer :price                     ,null: false

      t.integer :product_status_id
      t.integer :delively_cost_id
      t.integer :prefecture_id
      t.integer :delively_days_id

      t.timestamps
    end
  end
end
