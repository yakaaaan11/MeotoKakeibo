class ChangeDataatypePriceOfPays < ActiveRecord::Migration[5.2]
  def change
    change_column :pays, :price, :integer
  end
end
