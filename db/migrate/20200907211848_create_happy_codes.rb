class CreateHappyCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :happy_codes do |t|
      t.integer :code
      t.belongs_to :happy_price, index: true
      t.belongs_to :customer, index: true

      t.timestamps
    end
  end
end
