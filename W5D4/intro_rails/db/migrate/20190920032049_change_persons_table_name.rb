class ChangePersonsTableName < ActiveRecord::Migration[5.1]
  def change
     rename_table :persons, :people
  end
end
