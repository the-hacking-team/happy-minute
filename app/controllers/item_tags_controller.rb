class ItemTagsController < ApplicationController
  before_action :authenticate_owner!, except: [:show]
  before_action :is_my_business, except: [:show]

  def create
    @item = Item.find(params[:item_id])
    @business = @item.business
    @item_tag = @item.item_tags.new(item_tag_params)
    if @item_tag.save
      redirect_to edit_business_item_path(@business, @item), flash: { success: 'Produit bien ajouté au menu' }
    else
      redirect_to edit_business_item_path(@business, @item), flash: { warning: "Le produit n'a pas pu être ajouté" }
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @business = @item.business
    @item_tag = @item.item_tags.find_by(tag_id: params[:tag_id])
    @item_tag.destroy
    redirect_to edit_business_item_path(@business, @item), flash: { warning: 'Le tag a été retiré du produit' }
  end

  private

  def item_tag_params
    params.require(:item_tag).permit(:tag_id)
  end

  def is_my_business
    unless current_owner == Item.find(params[:item_id]).business.owner
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end
