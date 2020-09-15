class Business < ApplicationRecord
  belongs_to :owner
  has_many :items
  has_many :business_follows
  has_many :customers, through: :business_follows
  has_one_attached :business_photo
  has_many :menus

  validates :name, presence: true
  validates :address, presence: true

  def number_happy_prices
    i = 0
    items.each do |item|
      i += item.happy_prices.size
    end
    i
  end
end
