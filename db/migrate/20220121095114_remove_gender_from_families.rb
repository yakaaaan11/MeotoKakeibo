class RemoveGenderFromFamilies < ActiveRecord::Migration[5.2]
  def change
    remove_column :families, :gender, :string
  end
end
