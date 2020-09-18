class BusinessPhotosController < ApplicationController
  before_action :authenticate_owner!

  def create
    @business = Business.find(params[:business_id])
    if params[:business_photo]
      @business.business_photo.attach(params[:business_photo])
      flash[:success] = 'Votre photo a bien été ajoutée'
    else
      flash[:warning] = 'Vous n\'avez pas sélectionné de photo'
    end
    redirect_to(business_path(@business))

  rescue Exception => e
  redirect_to(business_path(@business))
  end
end
