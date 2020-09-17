class HappyPrice < ApplicationRecord
  belongs_to :item
  has_many :happy_codes

  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :dates_dont_overlap2
  validate :lower_price

  after_create :notify_followers_email

  def started?
    start_date && start_date <= DateTime.now
  end

  def ended?
    end_date && end_date < DateTime.now
  end

  def in_stock?
    stock > 0
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

  private

  def notify_followers_email
    # Deliver the mail to notify the followers
    # ----------------------------------------
    # See https://stackoverflow.com/questions/8709984/how-to-catch-error-exception-in-actionmailer

    CustomerMailer.with(happy_price: self).notify_followers_email.deliver_now
  rescue Exception => e
  end

  def dates_dont_overlap
    overlapping = item.happy_prices.filter do |happy_price|
      start_date < happy_price.end_date && happy_price.start_date < end_date
    end.first
    errors.add(:start_date, "Le Happy Minute chevauche un autre à #{overlapping.price} €") if overlapping
  end

  def dates_dont_overlap2
    not_overlapping = true
    item.happy_prices.each do |happy_price|
      not_overlapping = false if start_date < happy_price.end_date && happy_price.start_date < end_date
    end
    errors.add(:start_date, 'Le Happy Minute chevauche un autre') unless not_overlapping == true
  end

  def lower_price
    errors.add(:price, "Le prix doit être inférieur au prix usuel de #{item.price} €") unless price < item.price
  end
end
