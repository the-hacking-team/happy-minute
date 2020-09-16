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
    # Deliver the order to the user
    # ------------------------------
    # See https://stackoverflow.com/questions/8709984/how-to-catch-error-exception-in-actionmailer
    begin
      CustomerMailer.with(customer: self).welcome_email.deliver_now
      puts "Envoie du mail semble ok"
    rescue Exception => e
      puts "="*80
      puts "ERREUR : Il y a eu un problème dans l'envoi du mail, merci de nous contacter"
      puts "="*80
      flash[:warning] = "Il y a eu un problème dans l'envoi du mail, merci de nous contacter"
    end
  end
end
