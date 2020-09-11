class BusinessPhotosController < ApplicationController
  before_action :authenticate_owner!

  def create
    @business = Business.find(params[:business_id])

    if @business.business_photo.attach(params[:business_photo])
      redirect_to(business_path(@business))
    else
      flash[:danger] = 'Vous ne pouvez pas effectuer cette action'
      redirect_to(business_path(@business))
    end
  rescue Exception => e
    # FIXME: can't see notice
    flash[:notice] = 'Vous ne pouvez pas effectuer cette action'
  end
end
