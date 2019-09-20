class AddHouseIdToPersons < ActiveRecord::Migration[5.1]
  def change
    add_column :persons, :house_id, :integer, {null: false}
  end
end
