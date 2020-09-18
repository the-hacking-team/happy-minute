class ItemTagsController < ApplicationController
  before_action :authenticate_owner!, except: [:show]
  before_action :is_my_business, except: [:show]

  def create
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:item_id])
    @item_tag = @item.item_tags.new(item_tag_params)
    if @item_tag.save
      redirect_to edit_business_item_path(@business, @item), flash: { success: 'Tag bien ajouté' }
    else
      redirect_to edit_business_item_path(@business, @item), flash: { warning: "Le tag n'a pas pu être ajouté" }
    end
  end

  def destroy
    @business = Business.find(params[:business_id])
    @item = @business.items.find(params[:item_id])
    @item_tag = @item.item_tags.find(params[:id])
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
