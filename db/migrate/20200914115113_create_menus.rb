class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :position
      t.belongs_to :business, index: true

      t.timestamps
    end
  end
end
