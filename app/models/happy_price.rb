class HappyPrice < ApplicationRecord
  belongs_to :item
  has_many :happy_codes
end
