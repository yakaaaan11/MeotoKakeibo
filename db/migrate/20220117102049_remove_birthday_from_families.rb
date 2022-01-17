class RemoveBirthdayFromFamilies < ActiveRecord::Migration[5.2]
  def change
    remove_column :families, :birthday, :date
  end
end
