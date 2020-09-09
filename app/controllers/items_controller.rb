class ItemsController < ApplicationController
  def index
    @business = Business.find(params[:business_id])
    @items = @business.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @business = Business.find(params[:business_id])
    @item = Item.new(business: @business.id)
  end

  def create
    @item = Item.new(item_params)
    @item.business = @business

    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @event.update(item_params)
      redirect_to @item, flash: { success: 'Produit mis à jour !' }
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category, :price, :available, :photo)
  end
end
