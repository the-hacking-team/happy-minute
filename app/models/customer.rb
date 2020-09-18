class Customer < ApplicationRecord
  has_many :business_follows
  has_many :businesses, through: :business_follows
  has_many :happy_codes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

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

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
