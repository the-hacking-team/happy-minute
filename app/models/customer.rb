class Customer < ApplicationRecord
  has_many :business_follows
  has_many :businesses, through: :business_follows
  has_many :happy_codes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, if: :truemail_test
  validates_confirmation_of :password

  after_create :welcome_email

  def name
    "#{first_name} #{last_name}" if first_name || last_name
  end

  private

  def truemail_test
    errors.add(:email, "Le domaine n'est pas valide") unless Truemail.validate(email).result.success == true
  end

  def welcome_email
    # Deliver the mail to the customer
    # --------------------------------
    # See https://stackoverflow.com/questions/8709984/how-to-catch-error-exception-in-actionmailer

    CustomerMailer.with(customer: self).welcome_email.deliver_now
  rescue Exception => e
  end
end
