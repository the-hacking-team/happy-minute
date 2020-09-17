class Customer < ApplicationRecord
  has_many :business_follows
  has_many :businesses, through: :business_follows
  has_many :happy_codes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, if: :truemail_test
  
  after_create :welcome_email

  def name
    if first_name || last_name
      "#{first_name} #{last_name}"
    end
  end

  private
  def truemail_test
    unless Truemail.validate(self.email).result.success == true
      errors.add(:email, "Le domaine n'est pas valide")
    end
  end

  def welcome_email
    CustomerMailer.with(customer: self).welcome_email.deliver_now
  end
end