class Owner < ApplicationRecord
  has_many :businesses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_confirmation_of :password
  validates :email, presence: true, if: :truemail_test

  after_create :welcome_email

  def name
    if first_name || last_name
      "#{first_name} #{last_name}"
    else
      email
    end
  end

  private

  def truemail_test
    unless Truemail.validate(self.email).result.success == true
      errors.add(:email, "Le domaine n'est pas valide")
    end
  end

  def welcome_email
    OwnerMailer.with(owner: self).welcome_email.deliver_now
  end
end
