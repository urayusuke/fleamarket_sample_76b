class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :product            ,foreign_key: true,null: false
      t.string :src                    ,null: false
      t.timestamps
    end
  end
end
