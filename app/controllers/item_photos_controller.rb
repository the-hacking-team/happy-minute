class ItemPhotosController < ApplicationController
  before_action :authenticate_owner!

  def create
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:item_id])

    if params[:item_photo]
      @item.item_photo.attach(params[:item_photo])
      flash[:success] = 'Votre photo a bien été ajoutée'
    else
      # No selected picture
      flash[:warning] = 'Vous n\'avez pas sélectionné de photo'
    end
    redirect_to(business_item_path(@business, @item))

  rescue Exception => e
    redirect_to(business_item_path(@business, @item))
  end
end
