class ItemsController < ApplicationController
  def index
    @business = Business.find(params[:business_id])
    @items = @business.items
  end

  def show
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:id])
  end

  def new
    @business = Business.find(params[:business_id])
    @item = @business.items.new
  end

  def create
    @business = Business.find(params[:business_id])
    @item = @business.items.create(item_params)
    render :show
  end

  def edit
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:id])
  end

  def update
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:id])
    if @item.update(item_params)
      render :show
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
