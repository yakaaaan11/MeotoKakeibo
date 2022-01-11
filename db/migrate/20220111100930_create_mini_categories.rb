class CreateMiniCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :mini_categories do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name

      t.timestamps
    end
  end
end
