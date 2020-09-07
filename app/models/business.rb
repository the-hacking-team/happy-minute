class Business < ApplicationRecord
  belongs_to :owner
  has_many :items
end
