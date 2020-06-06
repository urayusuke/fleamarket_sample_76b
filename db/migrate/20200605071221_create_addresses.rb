class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user                   ,foreign_key: true,null: false
      
      t.string :delively_last_name         ,null: false
      t.string :delively_first_name        ,null: false
      t.string :delively_last_name_kana    ,null: false
      t.string :delively_first_name_kana   ,null: false
      
      t.string :postcode                   ,null: false
      t.string :prefecture                 ,null: false
      t.string :city                       ,null: false
      t.string :block                      ,null: false
      t.string :building                   
      t.string :phone_number               

      t.timestamps
    end
  end
end
