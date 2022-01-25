class AddGenderToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :gender, :string
  end
end
