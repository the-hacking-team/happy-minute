class Item < ApplicationRecord
  belongs_to :business
  has_one :happy_price
  has_one_attached :item_photo
end
