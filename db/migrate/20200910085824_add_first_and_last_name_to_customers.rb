# frozen_string_literal: true

class AddFirstAndLastNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
  end
end
