class BusinessFollowsController < ApplicationController
  
  def create 
    @business = Business.find(params[:id])
    @customer = current_customer

    @business_follow = BusinessFollow.create(business_id: @business.id, customer_id: current_customer.id, notification: true)
  
    redirect_to root_path
  end 

  
  def destroy 
    @business = Business.find(params[:id])
    @customer = current_customer

    BusinessFollow.find_by(business_id: @business.id, customer_id: @customer.id).destroy
    redirect_to root_path
  end
end
