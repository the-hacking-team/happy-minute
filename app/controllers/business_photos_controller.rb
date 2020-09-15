class BusinessPhotosController < ApplicationController
  before_action :authenticate_owner!

  def create
    @business = Business.find(params[:business_id])
    if params[:business_photo]
      if @business.business_photo.attach(params[:business_photo])
        flash[:success] = 'Votre photo a bien été ajoutée'
      else
        flash[:notice] = 'Vous ne pouvez pas effectuer cette action'
      end
    else
      flash[:warning] = 'Vous n\'avez pas sélectionné de photo'
    end
    redirect_to(business_path(@business))

  rescue Exception => e
  flash[:warning] = 'Vous ne pouvez pas effectuer cette action'
  redirect_to(business_path(@business))
  end
end
