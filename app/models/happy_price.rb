class HappyPrice < ApplicationRecord
  belongs_to :item
  has_many :happy_codes

  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :dates_dont_overlap
  validate :lower_price
  validate :start_date_after_now
  validate :start_date_before_end_date

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

  def time_str_french
    time.humanize
        .gsub('and', 'et')
        .gsub('Seconds', 'secondes')
        .gsub('Second', 'seconde')
        .gsub('Hours', 'heures')
        .gsub('Hour', 'heure')
        .gsub('Days', 'jours')
        .gsub('Day', 'jour')
  end

  def active?
    started? && !ended? && in_stock? && !id.nil?
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

  def start_date_before_end_date
    return unless start_date && end_date

    errors.add(:end_date, 'La date de fin doit être après la date de début') unless start_date < end_date
  end

  def start_date_after_now
    return unless start_date

    errors.add(:end_date, 'La date de fin doit être dans le futur') unless DateTime.now < end_date
  end

  def dates_dont_overlap
    return unless price && start_date && end_date

    overlapping = item.happy_prices.filter do |happy_price|
      start_date < happy_price.end_date && happy_price.start_date < end_date && happy_price != self
    end.first
    errors.add(:start_date, "Le Happy Minute chevauche un autre à #{overlapping.price} €") unless overlapping.nil?
  end

  def lower_price
    return unless price

    errors.add(:price, "Le prix doit être inférieur au prix usuel de #{item.price} €") unless price < item.price
  end
end
