class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
