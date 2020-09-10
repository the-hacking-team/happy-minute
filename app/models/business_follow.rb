class BusinessFollow < ApplicationRecord
  belongs_to :customer
  belongs_to :business
end