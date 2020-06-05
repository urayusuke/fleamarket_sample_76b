class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user                   ,foreign_key: true,null: false

      t.string :name                       ,null: false
      t.string :content                    ,null: false
      t.string :bland_name         
      t.string :status                     ,null: false
      t.integer :price                     ,null: false

      t.string :delively_cost              ,null: false
      t.string :delively_prefecture        ,null: false
      t.string :delively_days              ,null: false

      t.timestamps
    end
  end
end
