class AddTagToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :item_tags, :tag, foreign_key: true
    add_reference :item_tags, :item, foreign_key: true
  end
end
