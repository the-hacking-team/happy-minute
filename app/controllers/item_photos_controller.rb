class ItemPhotosController < ApplicationController
  before_action :authenticate_owner!

  def create
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:item_id])

    if @item.item_photo.attach(params[:item_photo])
      redirect_to(business_item_path(@business, @item))
    else
      flash[:danger] = 'Vous ne pouvez pas effectuer cette action'
      redirect_to(business_item_path(@business, @item))
    end
  rescue Exception => e
    # FIXME: can't see notice
    flash[:notice] = 'Vous ne pouvez pas effectuer cette action'
  end
end
