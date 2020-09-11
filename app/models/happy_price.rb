# frozen_string_literal: true

class HappyPrice < ApplicationRecord
  belongs_to :item
  has_many :happy_codes

  def started?
    start_date && start_date <= DateTime.now
  end

  def ended?
    end_date && end_date < DateTime.now
  end

  def in_stock?
    stock.positive?
  end

  def stock
    quantity ? quantity - happy_codes.size : 0
  end

  def time
    TimeDifference.between(DateTime.now, end_date || DateTime.now)
  end

  def active?
    started? && !ended? && in_stock?
  end

  # FIXME: what happens if 2 customers click exact same time for last happy_price in stock?
  def get_new_code
    code = rand(1000..9999)
    if !active?
      nil
    elsif happy_codes.any? { |hc| hc.code == code }
      get_new_code
    else
      code
    end
  end
end
