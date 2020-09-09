class CreateHappyPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :happy_prices do |t|
      t.decimal :price
      t.datetime :start_date
      t.datetime :end_date
      t.integer :quantity
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
