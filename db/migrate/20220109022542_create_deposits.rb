class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.integer :user_id
      t.integer :price

      t.timestamps
    end
  end
end
