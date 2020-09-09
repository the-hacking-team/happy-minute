class AddFirstAndLastNameToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :first_name, :string
    add_column :owners, :last_name, :string
  end
end
