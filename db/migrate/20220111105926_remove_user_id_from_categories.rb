class RemoveUserIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :user_id, :integer
  end
end
