class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :user_id
      t.integer :family_id
      t.integer :price
      t.date :date
      t.text :memo

      t.timestamps
    end
  end
end
