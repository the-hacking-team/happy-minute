class CreateBusinessFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :business_follows do |t|
      t.boolean :notification
      t.belongs_to :customer, index: true
      t.belongs_to :business, index: true


      t.timestamps
    end
  end
end
