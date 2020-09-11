class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.boolean :available
      t.text :description
      t.string :category
      t.belongs_to :business, index: true

      t.timestamps
    end
  end
end
