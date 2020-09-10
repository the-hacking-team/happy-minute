class BusinessPhotosController < ApplicationController

  before_action :authenticate_owner!

  def create
    @business = Business.find(params[:business_id])
    @business.business_photo.attach(params[:business_photo])
    redirect_to(business_path(@business))
  end
end
