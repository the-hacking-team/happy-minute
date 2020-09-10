class CustomersController < ApplicationController

  before_action :authenticate_customer!, only: [:show]
  before_action :is_my_profile, only: [:show]

  def show
    @customer = current_customer
  end

  private

  def is_my_profile
    unless current_customer == Customer.find(params[:id])
      flash[:danger] = "Vous ne pouvez pas accéder aux informations de ce compte"
      redirect_to :root
    end
  end

end
