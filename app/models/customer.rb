class Customer < ApplicationRecord
  has_many :business_follows
  has_many :businesses, through: :business_follows
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def name
    if first_name || last_name
      "#{first_name} #{last_name}"
    else
      email
    end
  end
end
