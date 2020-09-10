class Item < ApplicationRecord
  belongs_to :business
  has_many :happy_prices
  has_one_attached :item_photo

  validates :title, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :available, presence: true
  validates :description, presence: true

  def current_happy_price
    happy_prices.filter(&:active?).first
  end

end
