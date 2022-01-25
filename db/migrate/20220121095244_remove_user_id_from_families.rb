class RemoveUserIdFromFamilies < ActiveRecord::Migration[5.2]
  def change
    remove_column :families, :user_id, :integer
  end
end
