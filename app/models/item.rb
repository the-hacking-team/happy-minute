class Item < ApplicationRecord
  belongs_to :business
  has_many :happy_prices

  def current_happy_price
    happy_prices.filter(&:active?).first
  end
end
