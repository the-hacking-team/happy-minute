class Item < ApplicationRecord
  belongs_to :business
  has_many :happy_prices
  has_one_attached :item_photo

  def current_happy_price
    happy_prices.filter(&:active?).first
  end

  def upcoming_happy_prices
    happy_prices.filter { |hp| !hp.started? }
  end
end
