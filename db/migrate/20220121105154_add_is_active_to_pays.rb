class AddIsActiveToPays < ActiveRecord::Migration[5.2]
  def change
    add_column :pays, :is_active, :boolean, default: false, null: false
  end
end
