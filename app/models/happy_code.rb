# frozen_string_literal: true

class HappyCode < ApplicationRecord
  belongs_to :happy_price
  belongs_to :customer
end
