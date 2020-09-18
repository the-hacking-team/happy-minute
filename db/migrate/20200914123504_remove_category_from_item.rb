class RemoveCategoryFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :category, :string
  end
end
