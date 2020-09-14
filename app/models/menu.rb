class Menu < ApplicationRecord
  belongs_to :business
  has_many :menu_items
  has_many :items, through: :menu_items
end
