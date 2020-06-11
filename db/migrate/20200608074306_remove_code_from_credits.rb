class RemoveCodeFromCredits < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :code, :string
  end
end
