class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :family_id
      t.string :price
      t.date :date
      t.text :memo

      t.timestamps
    end
  end
end
