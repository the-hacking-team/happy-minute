class Menu < ApplicationRecord
  belongs_to :business
  has_many :menu_items
  has_many :items, through: :menu_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
