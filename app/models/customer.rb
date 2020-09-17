class Customer < ApplicationRecord
  has_many :business_follows
  has_many :businesses, through: :business_follows
  has_many :happy_codes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_confirmation_of :password

  after_create :welcome_email

  def name
    if first_name || last_name
      "#{first_name} #{last_name}"
    else
      email
    end
  end

  private

  def welcome_email
    # Deliver the mail to the customer
    # --------------------------------
    # See https://stackoverflow.com/questions/8709984/how-to-catch-error-exception-in-actionmailer
    begin
      CustomerMailer.with(customer: self).welcome_email.deliver_now
    rescue Exception => e
      #
    end
  end
end
