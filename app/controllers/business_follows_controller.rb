class BusinessFollowsController < ApplicationController
  before_action :authenticate_customer!

  def create 
    @business = Business.find(params[:id])
    @customer = current_customer

    if @business_follow = BusinessFollow.create(business_id: @business.id, customer_id: current_customer.id, notification: true)
      flash[:success] = "Cet établissement a été ajouté à vos établissements suivis"
      redirect_to root_path
    else  
      flash[:danger] = "Vous ne pouvez pas effectuer cette action"
      redirect_to root_path
    end 
  end 

  
  def destroy 
    @business = Business.find(params[:id])
    @customer = current_customer

    BusinessFollow.find_by(business_id: @business.id, customer_id: @customer.id).destroy
    flash[:success] = "Cet établissement a été retiré de vos établissements suivis"
    redirect_to root_path
  end
end
