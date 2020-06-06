class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.references :user               ,foreign_key: true,null: false
      t.string :code                   ,null: false
      t.timestamps
    end
  end
end
