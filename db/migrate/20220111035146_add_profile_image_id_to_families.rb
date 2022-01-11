class AddProfileImageIdToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :image_id, :string
  end
end
