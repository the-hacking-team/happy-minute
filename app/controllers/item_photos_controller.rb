class ItemPhotosController < ApplicationController
  def create
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:item_id])
    @item.item_photo.attach(params[:item_photo])
    redirect_to(business_item_path(@business, @item))
  end
end
