class Owner < ApplicationRecord

  has_many :businesses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_email

  private

  def welcome_email
    OwnerMailer.with(owner: self).welcome_email.deliver_now!
  end
end
