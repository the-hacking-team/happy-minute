class MenuItemsController < ApplicationController
  before_action :authenticate_owner!, except: [:show]
  before_action :is_my_business, except: [:show]

  def create
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @menu_item = @menu.menu_items.new(item_menu_params)
    if @menu_item.save
      redirect_to edit_business_menu_path(@business, @menu), flash: { success: 'Produit bien ajouté au menu' }
    else
      redirect_to edit_business_menu_path(@business, @menu), flash: { warning: "Le produit n'a pas pu être ajouté" }
    end
  end

  def destroy
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @menu_item = @menu.menu_items.find_by(item_id: params[:item_id])
    @menu_item.destroy
    redirect_to edit_business_menu_path(@business, @menu), flash: { warning: 'Le produit a été retiré du menu' }
  end

  private

  def item_menu_params
    params.require(:menu_item).permit(:item_id)
  end

  def is_my_business
    unless current_owner == Business.find(params[:business_id]).owner
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end
