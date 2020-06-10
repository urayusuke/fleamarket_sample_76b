class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :seller                 ,foreign_key: { to_table: :users } ,null: false  
      t.references :buyer                  ,foreign_key: { to_table: :users }

      t.string :name                       ,null: false
      t.string :content                    ,null: false
      t.string :bland_name         
      t.integer :price                     ,null: false

      t.integer :product_status_id         ,null: false
      t.integer :delively_cost_id          ,null: false
      t.integer :prefecture_id             ,null: false
      t.integer :delively_days_id          ,null: false

      t.timestamps
    end
  end
end
