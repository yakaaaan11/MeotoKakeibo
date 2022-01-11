class RemoveUserIdFromMiniCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :mini_categories, :user_id, :integer
  end
end
