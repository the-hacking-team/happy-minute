# frozen_string_literal: true

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
    if @item = @business.items.create(item_params)
      redirect_to business_item_path(@business, @item), flash: { success: 'Produit créé' }
    else
      render :new
    end
  end

  def edit
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:id])
  end

  def update
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:id])
    if @item.update(item_params)
      redirect_to business_item_path(@business, @item), flash: { success: 'Produit mis à jour' }
    else
      render :edit
    end
  end

  def destroy
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:id])
    @item.destroy
    redirect_to business_items_path(@business), flash: { success: 'Produit supprimé' }
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category, :price, :available)
  end
end
