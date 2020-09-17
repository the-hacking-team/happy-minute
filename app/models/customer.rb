class Customer < ApplicationRecord
  has_many :business_follows
  has_many :businesses, through: :business_follows
  has_many :happy_codes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :truemail_test
  after_create :welcome_email

  attr_accessor :truemail_test_result

  def name
    if first_name || last_name
      "#{first_name} #{last_name}"
    else
    
    end
  end

  private

  def truemail_test
    puts "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ on créé un profil"
    puts self.email
    if !Truemail.validate(self.email).result.success
    puts "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ l'adresse n'est pas valable"
    #:truemail_test_result = false
    else
    #:truemail_test_result = true
    end
  end

  def welcome_email
    CustomerMailer.with(customer: self).welcome_email.deliver_now
  end
end


#https://stackoverflow.com/questions/2701932/accessing-rails-flashnotice-in-a-model