class Item < ApplicationRecord
  belongs_to :business
  has_one :item
end
