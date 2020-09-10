class Item < ApplicationRecord
  belongs_to :business
  has_one :happy_price
end
