class ChangeHousecol < ActiveRecord::Migration[5.1]
  def change
    rename_column :houses, :name, :address
  end
end
