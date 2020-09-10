class BusinessFollowsController < ApplicationController
  
  def create 
    @business = Business.find(params[:id])
    @customer = current_customer

    @business_follow = BusinessFollow.create(business_id: @business.id, customer_id: current_customer.id, notification: true)
    
  end 

end
