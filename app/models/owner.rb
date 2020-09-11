# frozen_string_literal: true

class Owner < ApplicationRecord
  has_many :businesses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
    OwnerMailer.with(owner: self).welcome_email.deliver_now
  end
end
