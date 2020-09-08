class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :siret
      t.belongs_to :owner, index: true

      t.timestamps
    end
  end
end
