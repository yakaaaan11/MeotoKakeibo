class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :price

      t.timestamps
    end
  end
end
